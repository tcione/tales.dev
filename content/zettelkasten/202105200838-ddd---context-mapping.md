+++
title = "DDD - Context mapping"
date = "2021-05-20T08:38:00Z"

[extra]
zettelkasten_id = "202105200838"
+++
[[#vaughn-ddddis](/zettelkasten/tags/vaughn-ddddis)], on 4th chapter:

A context map is the formal interface between two [202105192148 DDD - Bounded Contexts](/zettelkasten/202105192148-ddd---bounded-contexts). It is important to outline this as a concept, because the alternative is submitting yourself to [202105200852 The big ball of mud](/zettelkasten/202105200852-the-big-ball-of-mud).

The main idea is that by having a formal agreement/interface, we have a clear contract around how [202105192149 DDD - Ubiquitous Language](/zettelkasten/202105192149-ddd---ubiquitous-language) between context are mapped.

The book lists some context mapping example. I'll separate them into how I rationalize them.

**Basic models of relationship**
- Partnership: both contexts depend on each other. This requires strong and constant communication between teams
- Shared Kernel: the contexts rely on a shared piece of software. Ideally only one team is responsible for that piece of software and coordinates the changes
- Customer-Supplier: Upstream (supplier) X downstream (customer) relationship. Both sides have sway in the APIs and must constantly align

**Forms of relationship (usually applicable to customer-supplier)**
- Conformist: Customer has no decision power over what's supplied (external APIs are a good example)
- Anticorruption layer: a defensive strategy. The customer creates a layer to translate from the supplier ubiquitous language to their own
- Open Host Service: supplier provides access to their bounded context via a well-defined interface (RPCs are usually a good example of that)

**Transport devices**
- Having a **Published language** for information exchange between two contexts helps both sides to know what to expect and what to send. This can be used in conjunction with most strategies listed above.


[[#vaughn-ddddis](/zettelkasten/tags/vaughn-ddddis)]: Vernon, Vaughn. Domain-Driven Design Distilled. Boston: Addison-Wesley, 2016.
