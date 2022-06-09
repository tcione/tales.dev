+++
title = "Site reliability and 9's"
date = "2021-08-22T20:22:00Z"

[extra]
blips_id = "202108222022"
+++
[[#rickard-sre-math](/blips/tags/rickard-sre-math)] makes it clear that adding 9's to your SLAs is a big commitment. While the meaning of a 9 scales linearly, the effort goes exponentially.

Anyways, for refs:

```
Uptime - Downtime (Yearly)
99.00000%  - 3d 15h 39m
99.90000%  - 8h 45m 56s 
99.99000%  - 52m 35s
99.99900%  - 5m 15s
99.99990%  - 31s
99.99999%  - 3s
```

[[#rickard-sre-math](/blips/tags/rickard-sre-math)]: Matt Rickard. “Service Reliability Math That Every Engineer Should Know,” August 8, 2021. [https://matt-rickard.com/service-reliability-math-that-every-engineer-should-know/](https://matt-rickard.com/service-reliability-math-that-every-engineer-should-know/).
