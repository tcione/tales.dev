+++
title = "Managing code work with feature branches"
date = 2022-05-30T15:00:00Z
description = ""
summary = ""

[taxonomies]
tags=["software-development"]

[extra]
cannonical_url="https://medium.com/heyjobs-tech/managing-code-work-with-feature-branches-c08070065d5d"
cannonical_url_medium="Heyjobs Tech Blog"
+++

{{
captioned_image(
  src='https://miro.medium.com/max/1400/1*lzATKjXvZ9IE5Jq3UknSig.jpeg'
  alt='Multiple maps on top of each other'
  caption='Photo by <a href="https://unsplash.com/@anniespratt" target="_blank" rel="noopener">Annie Spratt</a> on <a href="https://unsplash.com/" target="_blank" rel="noopener">Unsplash</a>'
)
}}

There are [several ways](https://www.atlassian.com/git/tutorials/comparing-workflows) to develop software in a collaborative environment. One common workflow is leveraging “Feature Branches”. What are those, you might ask?

To simplify it a lot, they are software work (normally features) developed in dedicated branches and then submitted for review. Once the code is reviewed, one should update it using the latest main branch, [rebase](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase) and merge.

This method has two advantages:

*   It structures a practical way for developers to build things in parallel
*   Creates potential for a sensible commit history in the main branch¹

Neat, huh? Not all of it, though. Sometimes feature branches can foster problems. As they grow in age and size, coalescing becomes harder. At some point, things get so different that we have to dedicate days to making that feature branch production-ready.

A disclosure before we continue: if your feature is just small, feel free to ignore everything that follows. Just create your branch, deploy your feature and move on 😬. That said, let’s go!

How can we use this strategy without harming our projects? **The preferable thing would be to break down your development into small, independent, and functional pieces as much as possible**. When impossible, still use long-lived feature branches, but employ some tactics to make it manageable. Let’s start by talking about breaking things down.

## On breaking things down

When it comes to dividing work, it can be useful to ask three questions:

1.  Can I deploy this in isolation?
2.  If not, can I deploy it in a way that they peacefully interact with other pieces?
3.  If not, can I switch the pieces off on demand?

To answer these questions, I need to define what isolation, peacefulness, and switching things off mean to me.

### Isolated pieces

The main idea of this tactic is to try to break down work into pieces that **can be deployed to production**. However, **are unreachable by the users and active procedures**. They are just hanging around in isolation, eagerly waiting to be integrated. Some examples can be:

*   Introduction of new API endpoints
*   Introduction of new tables or columns
*   Refactorings² that will help that feature’s development

### Peaceful pieces

We can employ this tactic whenever we can deploy pieces that are exposed and integrated but do not have a direct effect on current user experience or procedures. Some examples can be:

*   Calculating values once an entity is saved to the database
*   REST API fields can be introduced with default values
*   Changes in internal APIs that can be temporary integrated using [structural design patterns](https://refactoring.guru/design-patterns/structural-patterns) like [Facades](https://refactoring.guru/design-patterns/facade)

### Switched off pieces

There are times that we can break it down, but the change is impossible to separate from existing behavior. For those cases, we can leverage feature flags. [There](https://www.growthbook.io/) [are](https://www.getunleash.io/) [several](https://launchdarkly.com/) robust options here, nonetheless, good ole ENV variables can do the trick as well. **The downside is that we have to maintain two implementations at the same time (the one currently active and the one hidden under the flag)**. Some examples can be:

*   Doing UI changes per component and then making them available all at once
*   Doing significant changes to one API endpoint before the API consumers can be adapted
*   Adding support for new devices, browsers, and/or users of different regions

Now, what if even after carefully considering these breakdown possibilities, we still think we’ll need a long-lived branch? Well, our only option is to make it bearable :). But… how?

## On managing the unavoidable long-lived branches

As with everything, there is not a single answer. I can, however, tell you the things that worked well for me so far. I’ve come to organize my opinions into five rules.

### 1\. Keep it updated in relation to your main branch

Failing to do so will cause you lots of headaches. The number of conflicts after being separated from the main branch can be overwhelming and their resolution might end up consuming lots of testing hours.

### 2\. Keep your tests green

Related to (1). Make sure that tests always pass. From my experience, it’s preferable to constantly rework tests, than to fix a myriad of failing tests. It gets really hard to discern what is no longer relevant, what’s broken, and which new tests should be introduced.

### 3\. Implement changes via smaller branches

Pick up work that’s big enough to be its own thing, but small enough to not be manageable to reviewers³, The [single responsibility principle](https://en.wikipedia.org/wiki/Single-responsibility_principle) is a good way to define what a smaller branch can contain. If it does more than one thing, you might want to consider breaking it down. If it’s too small to do something independently, then it becomes meaningless.

### 4\. Avoid rebasing before work is over

Keeping a track record of what was done and where the changes came from helps in the long run. Opinions might differ here, but in case you’d prefer rebasing, try to include references to PRs that were merged in that branch.

### 5\. Perform QA only against the long-lived branch

If we’re using a long-lived branch, chances are that what we’re working on only makes sense as a single, concise package. So we should treat it as such when doing quality assurance. Outside of that testing, smaller branches in isolation can get confusing fast. Merging to the long-lived branch might introduce regressions or even new bugs afterward.

## Outro

Oof, that was a lot. Collaboration can be one of the more challenging aspects of software development, and it tends to get more complex as the team and software grows. Hopefully, this article has offered applicable ways to help you and your team to manage the ever-growing complexity of your coding stuff :)

---

\[1\]: What is a good commitment message and how to maintain a healthy git history are beyond the scope of this article. HOWEVER, I do encourage the watching of [“A Branch in Time” by Tekin Süleyman in 2019’s Rubyconf AU](https://www.youtube.com/watch?v=1NoNTqank_U)

\[2\]: [As defined by Martin Fowler](https://martinfowler.com/bliki/DefinitionOfRefactoring.html), meaning there will be no changes in input and output.

\[3\]: Huge PRs tend to be overwhelming. This encourages the reviewer to yield by typing “LGTM”
