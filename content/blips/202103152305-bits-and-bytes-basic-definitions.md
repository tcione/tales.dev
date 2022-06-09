+++
title = "Bits and bytes basic definitions"
date = "2021-03-15T23:05:00Z"

[extra]
blips_id = "202103152305"
+++
On [[#harris-harris-digital-design](/blips/tags/harris-harris-digital-design)], chapter 1.

**Bits**: most basic unit, those are the actual `0`s and `1`s
**Byte**: a group of 8 bits. I.e., `10101010`. A pair of hexadecimal numbers hold 1 byte. I.e, `AA` is the same as `10101010`
**Most significant bit**: bit on the leftmost part of the number
**Least significant bit**: bit on the rightmost part of the number
**Most significant byte:** byte on the leftmost part of the sequence
**Least significant byte**: byte on the rightmost part of the sequence
**Overflow**: when we misrepresent a number due to the lack of bits. Let's say we are adding to binaries of 4 bits, and the result would force us to carry over a `1` to a 5th bit. We'd still be able to represent the number with only 4 bits, thus overflowing

**Unsigned numbers**: Numbers have no sign. The examples we've seen so far are all unsigned. Unsigned binaries go from `0` to `2^n - 1`, `n` is the bit count.

**Signed numbers**: When the most significant bit represents a signal, not a number. I.e.,: 
$$0010 = +2, 1010 = -2$$

Signed binaries go from `-1 * (2^{n - 1} - 1)` to `2^{n - 1} - 1`

**Two complement numbers**: [#todo](/blips/tags/todo) definition and note

To know more about number notations, go to [202103151907 Decimal, binary and hexadecimal](/blips/202103151907-decimal--binary-and-hexadecimal)

[[#harris-harris-digital-design](/blips/tags/harris-harris-digital-design)]: Harris, David Money, and Sarah L. Harris. _Digital Design and Computer Architecture_. Second edition. Amsterdam: Elsevier, 2013. 
