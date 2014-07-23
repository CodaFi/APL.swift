APL.swift
=========

APL comes equipped with a rich and varied combinator library for the manipulation of arrays and scalar values.  The novelty of the language's approach is that it completely divorces itself from the pervasiveness of English in traditional programming languages.  That is to say the combinators are given 1-symbol aliases and a breathtakingly simple semantics such that the language itself transcends all language barriers.  Seeing as unicode characters are being embraced as operators in Swift, a full port of the complete array calculus should be possible while preserving these original names; albeit with a much more liberal use of parenthesis.

By embedding APL in a type system like the one Swift uses, it can be made an overall safer calculus at the cost of syntactic simplicity.

Operators
=========

Operators in APL come in two forms: Verbs and Adverbs.  Naturally, a verb is a Monadic or Diadic (one or two argument) function that acts upon its operands to produce a result.  An adverb is therefore a function that acts on a verb to lift it into a higher order function.  For example, APL defines the adverb `/`, or across, as a means of lifting a verb over an array.  (This allows something like `+/ 1 2 3 4` to be read literally as 'plus across the array [1, 2, 3, 4]').

Some operators will be interdefined, but will never clash with the Swift Standard Library, or with each other (Swift does not catch mutually (co-)recursive operators as of yet).  Generally, the more specialized the function, the better chance it will be interdefined.  Interestingly, all of APL's combinators can be derived from one another in some way, shape, or form, save some basic arithmetic and IO operators.

APL makes no provisions for side-effecting code, but the Standard Library necessitates inclusion of a random number generator and an `arc4random()`-like function.  IO is also possible from the Standard Library, but is not considered a part of the array calculus.  Side effecting operators like Roll will attempt to perform their duties by leaving as little perturbed as possible to maintain purity.


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

Booleans are a large part of APL, but their chosen form is either 0 or 1 for true and false respectively.  Functions will never return [Bool], but will instead opt for [Int] for display purposes only.


