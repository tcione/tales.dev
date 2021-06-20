+++
title = "DDD - Subdomains"
date = "2021-05-20T08:40:00Z"

[extra]
zettelkasten_id = "202105200840"
+++
[[#vaughn-ddddis](/zettelkasten/tags/vaughn-ddddis)], on 3rd chapter:

Subdomains are encompassed withing bounded context, and ideally they do not share their house with other subdomains (more on [202105192148 DDD - Bounded Contexts](/zettelkasten/202105192148-ddd---bounded-contexts)).

Subdomains are a good way to break up and reason about your Problem Space[1], which is normally too complex to take in as a whole.

There are 3 mains types of subdomains:
- Core Domain: the domain that's most relevant to your business. This is where you should pour most of your resources
- Supporting Domain: normally things that you still need specialized solutions (so no off-the-shelf options), so you have to commit resources to it as well. We must be careful to not dedicate too much attention to it, we should focus on feeding it according to the core domain necessities
- Generic Domain: usually we can acquire it from an external source (read "off-the-shelf solution"). These are things that we need, but it's not beneficial to develop our own

[1]: [202105192145 Problem Space VS Solution Space](/zettelkasten/202105192145-problem-space-vs-solution-space)
[[#vaughn-ddddis](/zettelkasten/tags/vaughn-ddddis)]: Vernon, Vaughn. Domain-Driven Design Distilled. Boston: Addison-Wesley, 2016.