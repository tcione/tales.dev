+++
title = "DDD - Value objects"
date = "2021-06-01T08:43:00Z"

[taxonomies]
tags=["korikov-entity-vs-value-object"]
+++
These are objects that have structural equality, thus are interchangeable when attributes contain the same values. They can indicate a link between two entities, short lived transactions, etc.

Whenever we cannot infer equality by structure, we probably have [202106010842 DDD - Entities](/blips/202106010842-ddd---entities) in our hands, since those are defined by inherent identity.

Resources to understand this better:
[[#korikov-entity-vs-value-object](/tags/korikov-entity-vs-value-object)]: Khorikov, Vladimir. “Entity vs Value Object: The Ultimate List of Differences.” Enterprise Craftsmanship. Accessed June 1, 2021. [https://enterprisecraftsmanship.com/posts/entity-vs-value-object-the-ultimate-list-of-differences/](https://enterprisecraftsmanship.com/posts/entity-vs-value-object-the-ultimate-list-of-differences/).
