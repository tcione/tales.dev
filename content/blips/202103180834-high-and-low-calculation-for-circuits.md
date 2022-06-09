+++
title = "HIGH and LOW calculation for circuits"
date = "2021-03-18T08:34:00Z"

[extra]
blips_id = "202103180834"
+++
On [[#harris-harris-digital-design](/blips/tags/harris-harris-digital-design)], chapter 1.

Digital systems use simplified representations of our analog reality. In the case of circuits, we have to translate current values (which are analog, thus not precise all the time) to 0s (coded as `LOW`) and 1s (coded as `HIGH`).

The way this is done is by defining ranges.  I,e., above 2V, this should be `HIGH`, bellow it, this should be `LOW`.

Of course things are not are clear cut as the example above, so we have to allow for some wiggle room, which is aptly named as `Noise margins`.

Before I put an image, let me provide some definitions:

HIGH: 1
LOW: 0
V: Voltage
NM: Noise margin
V<sub>DD</sub>: Max voltage
<sub>O</sub>: Output
<sub>I</sub>: Input
<sub>H</sub>: High
<sub>L</sub>: Low
Forbidden zone: place where we ignore the voltage. It is the space between the limit to consider something `LOW` and the limit to consider something `HIGH`

To illustrate this a bit better:

```
  Driver            Receiver
----|>o---------------|>

Vdd ======        ======
     HIGH          HIGH
Voh ======..............        
             NMh
    ..............====== Vih
				  
        Forbidden Zone
		
    ..............====== Vil
             NMl
Vol ======..............        
     LOW           LOW
0   ======        ======

```

And to define NMs:

$$NM_L = V_{IL} - V_{OL}$$
$$NM_H = V_{OH} - V_{IH}$$

---




[[#harris-harris-digital-design](/blips/tags/harris-harris-digital-design)]: Harris, David Money, and Sarah L. Harris. _Digital Design and Computer Architecture_. Second edition. Amsterdam: Elsevier, 2013. 
