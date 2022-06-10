+++
title = "DDD - Aggregates"
date = "2021-06-01T08:18:00Z"

[taxonomies]
tags=["vaughn-ddddis", "todo"]
+++
[[#vaughn-ddddis](/tags/vaughn-ddddis)], on 5th chapter:

Aggregates live within [202105192148 DDD - Bounded Contexts](/blips/202105192148-ddd---bounded-contexts). I'll try my best to grasp the concept, but I confess that I don't have a clear picture yet.

Aggregates are composed by [202106010842 DDD - Entities](/blips/202106010842-ddd---entities) and [202106010843 DDD - Value objects](/blips/202106010843-ddd---value-objects). **Also, they always have a root entity, everything else derive from it**.

Usually these are defined by some sort of business transaction. I.e: we can have a `Order` aggregate composed of `OrderItem` value objects. The order can canceled (which would be defined by the `status == CANCELED` [202106010845 DDD - Invariants|invariant](/blips/202106010845-ddd---invariants|invariant)) or the order can be finished when `status == FINISHED`.

Material that helped me a bit in understanding aggregates (although I don't get it ATM):
- https://thepaulrayner.com/blog/aggregates-and-entities-in-domain-driven-design/
- https://martinfowler.com/bliki/DDD_Aggregate.html

[#todo](/tags/todo): This is a mess. Need to make a second attempt to grok this

[[#vaughn-ddddis](/tags/vaughn-ddddis)]: Vernon, Vaughn. Domain-Driven Design Distilled. Boston: Addison-Wesley, 2016.
