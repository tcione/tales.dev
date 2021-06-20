+++
title = "DDD - Ubiquitous Language"
date = "2021-05-19T21:49:00Z"

[extra]
zettelkasten_id = "202105192149"
+++
[[#vaughn-ddddis](/zettelkasten/tags/vaughn-ddddis)], on 2nd chapter:

Ubiquitous Language is all about having unambiguous and precise naming for entities within a [202105192148 DDD - Bounded Contexts](/zettelkasten/202105192148-ddd---bounded-contexts). When we think about language in development, we focus on nouns, but it's important that we encompass language as a whole:

- Entities should be mapped to specific nouns
- Actions should consistently use the same verbs
- Variations should use precise adjectives
- etc etc

For instance, in a todo list app:

**user** can create **lists** and **add** **tasks** to them. Each **task** can have a single **assignee** and this **assignee** should be able to **archive**, **complete** or **assign** this task to another **user**.

The author suggests [202105192209 DDD - Event Storming](/zettelkasten/202105192209-ddd---event-storming) as a good way to discover candidates for our vocab.

[[#vaughn-ddddis](/zettelkasten/tags/vaughn-ddddis)]: Vernon, Vaughn. Domain-Driven Design Distilled. Boston: Addison-Wesley, 2016.
