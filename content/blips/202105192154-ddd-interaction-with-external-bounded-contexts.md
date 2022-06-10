+++
title = "DDD - Interaction with external bounded contexts"
date = "2021-05-19T21:54:00Z"

[taxonomies]
tags=["vaughn-ddddis"]
+++
[[#vaughn-ddddis](/tags/vaughn-ddddis)], on 2nd chapter:

[202105192148 DDD - Bounded Contexts](/blips/202105192148-ddd---bounded-contexts) should interact with other bounded context via well defined, external APIs. There are several tactics for that:

For communication:
- Event driven architecture (see also [202106091344 DDD - Domain Events](/blips/202106091344-ddd---domain-events))
- Command Query Responsibility Segregation 
- Reactive and Actor Model 
- Representational State Transfer (REST)
- Remote Procedure Call (RPC)

Possible architectures
- Service-Oriented Architecture (SOA)
- Microservices
- Monoliths with well defined internal APIs (removing the R from RPC :p)

[202106091344 DDD - Domain Events](/blips/202106091344-ddd---domain-events) offer good advice on how to establish clear communication standards and [202106091345 DDD - Event Sourcing](/blips/202106091345-ddd---event-sourcing) offers an idea on how to guarantee recovery.

[[#vaughn-ddddis](/tags/vaughn-ddddis)]: Vernon, Vaughn. Domain-Driven Design Distilled. Boston: Addison-Wesley, 2016.
