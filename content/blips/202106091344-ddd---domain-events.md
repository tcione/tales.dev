+++
title = "DDD - Domain Events"
date = "2021-06-09T13:44:00Z"

[extra]
blips_id = "202106091344"
+++
[[#vaughn-ddddis](/blips/tags/vaughn-ddddis)], on 6th chapter:

Domain events happen after something happened in your [202105192148 DDD - Bounded Contexts](/blips/202105192148-ddd---bounded-contexts). They broadcast that something happen, so all contexts that listen to this event can act accordingly.

Best practices for event domains:
- Add a timestamp (specially because the subscribers might not receive them synchronously)
- Use [202105192149 DDD - Ubiquitous Language](/blips/202105192149-ddd---ubiquitous-language)
- When naming, use the past tense
- Have enough data so everyone can act on it, but be careful not to be excessive

If it is important to reconstruct state by order of events, one should consider [202106091345 DDD - Event Sourcing](/blips/202106091345-ddd---event-sourcing)

[[#vaughn-ddddis](/blips/tags/vaughn-ddddis)]: Vernon, Vaughn. Domain-Driven Design Distilled. Boston: Addison-Wesley, 2016.
