APL.swift
=========

APL comes equipped with a rich and varied combinator library for the manipulation of arrays and scalar values.  The novelty of the language's approach is that it completely divorces itself from the pervasiveness of English in traditional programming languages.  That is to say the combinators are given 1-symbol aliases and a breathtakingly simple semantics such that the language itself transcends all language barriers.  Seeing as unicode characters are being embraced as operators in Swift, a full port of the complete array calculus should be possible while preserving these original names; albeit with a much more liberal use of parenthesis.

Operators
=========

Operators in APL come in two forms: Verbs and Adverbs.  Naturally, a verb is a Monadic or Diadic (one or two argument) function that acts upon its operands to produce a result.  An adverb is therefore a function that acts on a verb to lift it into a higher order function.  For example, APL defines the adverb `\`, or across, as a means of lifting a verb over an array.  (This allows something like `+/ 1 2 3 4` to be read literally as 'plus across the array [1, 2, 3, 4]')

Semantics
=========

All operators are right associative, and evaluation proceeds right to left.  For example, 

```APL
!w ÷ !a × (!w - a)
```

should be parsed as 

```APL
(!2 ÷ (!4 × (!2 - 4)))
```

and interpreted as

```APL
=> (!2 ÷ (!4 × (2 - 4)))
=> (!2 ÷ (!4 × -2))
=> (!2 ÷ (24 × -2))
=> (!2 ÷ -48)
=> (!2 ÷ -48)
=> -0.04166666667
```

