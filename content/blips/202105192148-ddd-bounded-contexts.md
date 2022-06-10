+++
title = "DDD - Bounded Contexts"
date = "2021-05-19T21:48:00Z"

[taxonomies]
tags=["vaughn-ddddis"]
+++
[[#vaughn-ddddis](/tags/vaughn-ddddis)], on 2nd chapter:

The bounded context encompasses the entities that are relevant to that specific [202105200840 DDD - Subdomains](/blips/202105200840-ddd---subdomains)[1]. Everything that's essential for that context should lie there. Everything else should be in another bounded context.

Each bounded context has its own [202105192149 DDD - Ubiquitous Language](/blips/202105192149-ddd---ubiquitous-language). So we have context-specific, but very precise terms.

A todo list app could be broken down into the following bounded contexts:
- The list context: contains lists, tasks in lists, assignee (users in the users context)
- The user context: contains user data
- The account context: contains billing data

The **list context** here would be our **core domain** (see [202105200840 DDD - Subdomains](/blips/202105200840-ddd---subdomains)) since it'd be the HEART of the business.

Look into [202105192154 DDD - Interaction with external bounded contexts](/blips/202105192154-ddd---interaction-with-external-bounded-contexts) for implementation tactics and read [202105200838 DDD - Context mapping](/blips/202105200838-ddd---context-mapping) for a better conceptual grasp around those interactions.


[1]: Although bounded contexts can contain more than 1 subdomain, it's best practice to limit to 1. So one bounded context contains one subdomain and vice-versa.
[[#vaughn-ddddis](/tags/vaughn-ddddis)]: Vernon, Vaughn. Domain-Driven Design Distilled. Boston: Addison-Wesley, 2016.
