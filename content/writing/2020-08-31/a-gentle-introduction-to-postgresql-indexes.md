+++
title = "A gentle introduction to PostgreSQL indexes"
date = 2020-08-31T15:00:00Z
description = ""
summary = ""

[taxonomies]
tags=["software-development"]

[extra]
cannonical_url="https://medium.com/heyjobs-tech/a-gentle-introduction-to-postgresql-indexes-fc58a2f5ba96"
cannonical_url_medium="Heyjobs Tech Blog"
+++

{{
captioned_image(
  src='https://miro.medium.com/max/1400/1*0X-pNeFVsj_4w0nC1qKC8Q.jpeg'
  alt='Files ordered by color in a shelf'
  caption='Photo by <a href="https://unsplash.com/@mvdheuvel" target="_blank" rel="noopener">Maarten van den Heuvel</a> on <a href="https://unsplash.com/" target="_blank" rel="noopener">Unsplash</a>'
)
}}

So, Indexes, am I right? Indexes are everywhere in relational databases, if you have ever worked with one, you may have thought about them to some extent. If you haven’t yet, you probably will at some point.

This article’s objective is to give you a brief overview of what indexes are and which indexes are available for PostgreSQL users. Alright, let’s go!

## What are indexes, and what are they for?

Indexes in our database tables have the same function as the indexes we use in our physical books. They help us to find things faster by providing a point of reference. That way, we can zoom to the result we want instead of looking for it entry by entry (also known as a **sequential scan** or **full table scan**).

That’s made possible by the magical use of caching. Whenever you define an index, the **Relational Database Management System** (RDBMS, for short, a role filled later in this article by PostgreSQL) stores the values separately using a specific data structure. Whenever you ask it to filter something, it knows where it’s stored and how to efficiently look for it.

That’s very cool, no? You know what also is very cool about this? It is that it brings us to our next topic.

## When indexes are used and what are their side effects

As in any magical thing, there are conditions to follow and trades to do.

### Let’s start by the conditions

*   When creating indexes, you must define what you’re indexing. It can be one or multiple columns. You can also add constraints like uniqueness (which can also be used to guarantee data integrity) and/or conditions in which that index is stored (i.e., only store indexes when a particular column equals a specific value). It’s worth mentioning that whenever you create a primary key or add a uniqueness constraint, an implicit index is devised for those columns.
*   For you to actually use your indexes, you must be either filtering or sorting data.
*   Creating an index doesn’t guarantee that it’ll be used by your RDBMS. Every RDBMS has something called a query planner. The query planner decides the best strategy to use, considering things like available capacity and table size.

### And let’s finish with the trade-offs

Remember that I’ve mentioned that indexes are stored using specific data structures? That means that whenever you are inserting or updating those indexed columns, your RDBMS will update those stored indexes.

It’ll go through the stored values and decide the best place to put that new value. For that, adding indexes might mean slower inserts, updates, and deletes. Although this is rarely a big problem, it’s something worth considering when adding new indexes.

One last thing to consider is that every index you add will take disk space as well. Again, usually not a big problem, but it’s a good thing to keep in mind.

With all that out of our way, let’s move to the next section.

## A brief tour through the index access methods offered by PostgreSQL

{{
captioned_image(
  src='https://miro.medium.com/max/1400/1*dQbAMfOBN15uDPgAoiVCTw.jpeg'
  alt='Board game map with train lines filled with tiny trains of multiple colors'
  caption='Photo by <a href="https://unsplash.com/@mirapolis" target="_blank" rel="noopener">Dave Photoz</a> on <a href="https://unsplash.com/" target="_blank" rel="noopener">Unsplash</a>'
)
}}

### There are 6 built-in index access methods:

1.  B-Tree (or balanced tree)
2.  Hash
3.  GiST
4.  SP-GiST
5.  GIN
6.  BRIN

### B-Tree (or Balanced tree)

B-Tree indexes are the default index type in PostgreSQL. Reason for that being that they fit well into most scenarios. Balanced trees indexes organize data using a [self-balancing binary search tree](https://en.wikipedia.org/wiki/Self-balancing_binary_search_tree).

It’s a type of index that’s great for comparison operators (`< <= = >= > BETWEEN`) and to test presence (`IS NULL`, `IS NOT NULL`, `IN`).

Since this is Postgres’ default access method, to create a B-Tree index, one must simply create it:

```sql
CREATE INDEX index_name ON table_name(column_name, …);
```

For the sake of being thorough, let’s also see how to explicitly create the index:

```sql
CREATE INDEX index_name ON table_name USING BTREE (column_name, …);
```

### Hash

Hash indexes store the indexes, well, using hashes, and their usage is limited to the equality operator (`=`). Even though B-Tree indexes cover the same usage, Hash indexes are faster and take less space, since looking up in hashes is way cheaper than looking up in trees.

Creating a hash index is similar to creating a B-Tree index as well:

```sql
CREATE INDEX index_name ON table_name USING HASH (column_name, …);
```

That said, it’s important to mention that **hash indexes are not recommended for those using a PostgreSQL 9.x and below**. The reason for that is because they are not crash-safe in those versions, meaning that if your RDBMS crashes for any reason, the hash indexes will have to be recreated.

## GIN

GIN stands for Generalized Inverted Index. This type of index can be used to make full-text searches faster. The way it works is that it creates one index per word coupled with its matching locations (that’s why it’s an inverted index).

The catch here is that you can only index `[tsvector](https://www.postgresql.org/docs/10/datatype-textsearch.html)` type columns with this access method. Aside from `LIKE` and `ILIKE`, there are many [interesting operators that can be used](https://www.postgresql.org/docs/12/functions-textsearch.html).

Now, how do I create one of those? Differently from Hash and B-Tree indexes, this one requires a bit more work:

1.  You must create a `tsvector` column. If you have a text column that you want to index, you can convert it using `to_tsvector(language, text)`. Examples: `to_tsvector('portuguese', 'O rato roeu a roupa do rei de Roma')`, `to_tsvector(‘english’, ‘The quick brown fox jumped over the lazy dog.')`
2.  You must make sure that this new column is always up to date with the source column (if there is a source column, of course). (From PostgreSQL 12 onwards you can use [Generated Columns](https://www.postgresql.org/docs/12/ddl-generated-columns.html) for that
3.  Now you can finally create your GIN index:

```sql
CREATE INDEX index_name ON table_name USING GIN (column_name);
```

### GiST

GiST stands for Generalized Search Tree. This index can also be used to improve full-text searches but stores its references using a height-balanced tree.

GiST indexes are lossy (I won’t get into detail why, but you can read it [here](https://www.postgresql.org/docs/9.1/textsearch-indexes.html) or [here](https://habr.com/ru/company/postgrespro/blog/444742/)). This means that the initial result can contain false positives. To eliminate those, PostgreSQL checks if the results actually match the set conditions afterward.

Unlike GIN, we can index not only `tsvector` type columns, but also `[tsquery](https://www.postgresql.org/docs/10/datatype-textsearch.html)` type columns.

Why would you use GiST over GIN, if one is lossy and the other is not? Well, here are some things to consider:

*   GIN indexes are slower to create, so writes are slower
*   GIN indexes are faster to fetch since there will be no additional fetches
*   GIN indexes occupy more disk space
*   GiST indexes are better for dynamic data if the number of words stays under 100,000

As creational steps go, GiST is also similar to GIN:

1.  You must create a `tsvector` or a `tsquery` column (you can create `tsquery` columns using `to_tsquery`. It takes the same parameters as `to_tsvector`)
2.  You must make sure this new column is always up to date
3.  You can run the following code to create the index:

```sql
CREATE INDEX index_name ON table_name USING GIST (column_name);
```

On a side note, the GiST index can also work well for geospatial data types, but I won’t get into that part. If you wish to, a LOT can be read [here](https://habr.com/ru/company/postgrespro/blog/444742/).

### SP-GiST

SP-GiST stands for space-partitioned GiST. Its strong suit is when indexing data that can be divided into non-intersecting clusters. Cities are an example of something that can be organized into non-intersecting groups since cities cannot belong to 2 countries or 2 regions.

So getting more technical again, this type of index is suitable for [quadtrees](https://en.wikipedia.org/wiki/Quadtree) (made possible by using `point` type columns), [k-dimensional trees](https://en.wikipedia.org/wiki/K-d_tree) (made possible by using `point` type columns), and [radix trees](https://en.wikipedia.org/wiki/Radix_tree) (made possible by using `text` type columns). The last one would fit well into our cities example if cities were described using the following format: `COUNTRY/REGION/CITY`.

Since I don’t fully understand this index myself, I’ll just leave an example SQL for its creation and then refer to 2 extensive articles in which you can get very familiar with this access method:

```sql
CREATE INDEX index_name ON table_name USING SPGIST (column_name);
```

And the articles:

*   [Indexes in PostgreSQL — 6 (SP-GiST)](https://habr.com/ru/company/postgrespro/blog/446624/)
*   [Space-partioning Trees in PostgreSQL: Realization and Performance](https://www.cs.purdue.edu/spgist/papers/icde06.pdf)

### BRIN

BRIN stands for Block Range Index. BRIN indexes are perfect when the indexed column value maps closely to its actual position in the table. It organizes data in blocks and registers the minimum and the maximum value contained in that block. With that information, PostgreSQL can efficiently scan only the data it actually needs to.

Columns that will only increase in value (ids or timestamps) are good candidates for BRIN indexes. Another appealing attribute is that BRIN occupies significantly less space than B-Tree indexes since it stores just the minimum and maximum values per range.

Creating BRIN indexes is quite straightforward:

```sql
CREATE INDEX index_name ON table_name USING BRIN (column_name);
```

## And that’s a wrap!

Oof that was a fun ride, wasn’t it? Since it was also a long one, I’ll leave you with a parting gift: a small TL;DR for this article.

*   **BTREE** is good for **comparison and sorting.** It is the default access method for PostgreSQL.
*   **HASH** is good for **equality.** Takes less space than **BTREE,** but should not be used prior to PostgreSQL 10.
*   **GIN** is good for **full-text search.** The indexed columns must be of the `tsvector` type.
*   **GIST** is good for **full-text and geospatial search.** The indexed column must be a `tsvector` or a `tsquery`. It takes less space than GIN, but it does additional look-ups.
*   **SPGIST** is good for **searching non-intersecting clusters.** It is good for quadtrees, k-dimensional trees, and redix trees.
*   **BRIN** is good for **searching sequential data.** It occupies less space than **BTREE,** but it’s less versatile because of it.

As with any subject, there is always more to learn. This article only covers the surface of it.

So if you’d like to dig deeper, here are some valuable resources:

*   [PostgreSQL internals documentation](https://www.postgresql.org/docs/12/internals.html)
*   [PostgreSQL documentation for Full Text Search](https://www.postgresql.org/docs/10/textsearch.html)
*   [A series of articles that take a thorough look at PostgreSQL indexes](https://habr.com/en/company/postgrespro/blog/441962/)

I hope you’ve found this article helpful. Take care!
