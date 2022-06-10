+++
title = "Decimal, binary and hexadecimal"
date = "2021-03-15T19:07:00Z"

[taxonomies]
tags=["harris-harris-digital-design"]
+++
This is a long stading issue of mine. I have to come across this time and time again, so I might as well have an easy reference.

## Decimal

It is the system we commonly use.

$$15 = 15_{10} = (1 * 10^1) + (5 * 10^0)$$

We can easily abstract this to the following formula (using decimal numbers)

$$(X * 10^n) + ... + (Y * 10^0)$$

Although obvious, this abstraction is valuable when jumping to systems with a base different from 10.

## Binary

The system computers use to work out their magic. It is composed of `0`s and  `1`s, thus binary.

$$1010_2 = (1 * 2^4) +  ... + (0 * 2^0) = 10_{10}$$

To convert a base 10 number to a base 2, one can:

- Fill digits from left to right following this algorithm:
```
Number: 84
Largest power that's equal to or smaller than number: 64 (2^6)

Top = left
Bottom = right

Now:

1: 84 >= 64
0: 84 - 64 = 20, 20 < 32 (32 = 2^5)
1: 20 >= 16 (16 = 2^ 4)
0: 20 - 16 = 4, 4 < 8
1: 4 >= 4
0: 0 < 2
0: 0 < 2

```

- Fill digits from right to left following this algorithm:
```

Number: 84
Largest power that's equal to or smaller than number: 64 (2^6)

Top = right
Bottom = left

0: 84 / 2 (no reminder)
0: 42 / 2 (no reminder)
1: 21 / 2 = 10 + 1 (reminder)
0: 10 / 2 (no reminder)
1: 5 / 2 = 4 + 1 (reminder)
0: 2 / 2 (no reminder)
1: 1 / 2 = 0 + 1(reminder)

```


## Hexadecimal 

Numbers with base 16. The thing is, binary numbers can get a bit long, so we can use hexadecimals to shorten things. The notation is the following:
- From 0 to 9, we use the same digits as in base 10
- From 10 to 15 we use from A to F

$$0 1 2 3 4 5 6 7 8 9 A B C D E F$$

1 hexadecimal digit contains 4 bits (see also [202103152305 Bits and bytes basic definitions](/blips/202103152305-bits-and-bytes-basic-definitions), so:
$$1010 = A$$

As logic an conversion goes, we can follow procesures similar to the ones listed under the **binary** topic. That said, let me paste a tidbit for reference:
$$3EF_{16} = (3 * 16^2) + ... + (15 * 16^0) = 1007_{10}$$

If you need further examples, explanations or exercises, those can be found at [[#harris-harris-digital-design](/tags/harris-harris-digital-design)], chapter 1.

[[#harris-harris-digital-design](/tags/harris-harris-digital-design)]: Harris, David Money, and Sarah L. Harris. _Digital Design and Computer Architecture_. Second edition. Amsterdam: Elsevier, 2013. 
