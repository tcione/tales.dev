+++
title = "DDD - Event Storming"
date = "2021-05-19T22:09:00Z"

[extra]
blips_id = "202105192209"
+++
[[#vaughn-ddddis](/blips/tags/vaughn-ddddis)] suggests Event Storming as good way to build a [202105192149 DDD - Ubiquitous Language](/blips/202105192149-ddd---ubiquitous-language). It is something that happens into a workshop format and can take several sessions (the author suggests 3/4 sessions of approx. 4 hours).

For the workshop you should have:
- Sticky notes of several color (so you can use it for visual taxonomy)
- A black sharpie with fine point
- A wide surface (preferably a wall)

It goes like this:
1. Brainstorm [202106091344 DDD - Domain Events](/blips/202106091344-ddd---domain-events)
2. Organize them in chronological order
3. Add the commands that cause the events right before each event (i.e: `SendMessage` would be the command for `MessageSent`)
4. Add the [202106010818 DDD - Aggregates](/blips/202106010818-ddd---aggregates) or [202106010842 DDD - Entities](/blips/202106010842-ddd---entities) that are related to the command between the command and the event. Sort of like "the command acts on this thing, which triggers that event"
5. Zoom out and draw lines to group what you generated in step 4 into [202105192148 DDD - Bounded Contexts](/blips/202105192148-ddd---bounded-contexts) and [202105200840 DDD - Subdomains](/blips/202105200840-ddd---subdomains)
6. Describe the views (as in an interface) that your user will need to act upon these domains discovered by you

This note is clearly a refresher, I strongly recommend myself (and others) to go back to the book whenever they want to conduct the workshop, there is a lot of insight that is not capture here (nor it should, since it's operational).

[[#vaughn-ddddis](/blips/tags/vaughn-ddddis)]: Vernon, Vaughn. Domain-Driven Design Distilled. Boston: Addison-Wesley, 2016.
