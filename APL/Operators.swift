//
//  Operators.swift
//  APL
//
//  Created by Robert Widmann on 8/16/14.
//  Copyright (c) 2014 Robert Widmann. All rights reserved.
//

import Foundation

// MARK: Math

//prefix operator + {} Defined by the STL
//prefix operator - {} Defined by the STL

/// Minus
prefix operator - {}

/// Trend | The trend of a number is its sign or zero.
prefix operator × {}

/// Times | Returns the result of e**(log(⍺) - log(1.0 / ⍵)), or the product of two numbers.
infix operator × { associativity right }

/// Per | Returns a result of (1 / ⍵)
prefix operator ÷ {}

/// Per | Returns the result of (⍺ / ⍵)
infix operator ÷ { associativity right }

/// Floor | Gives the floor or integer part of w
prefix operator ⌊ {}

/// Minimum | Yields the lesser of a and w
infix operator ⌊ { associativity right }

/// Ceiling | Rounds upward, then yields the integer part of w
prefix operator ⌈ {}

/// Maximum | Yields the greater of a and w
infix operator ⌈ { associativity right }

/// Size | Yields the size or "absolute value" for a real or complex argument.
prefix operator | {}

/// Residue | TODO: Relax definition from fmod to "tolerant" residue
/// ⍺|⍵ ←→ ⍵-⍺×⌊s   if (⍺≠0)^(⌈s)≠⌊s←⍵÷⍺+⍺=0
///     ←→ ⍵×⍺=0    otherwise
infix operator | { associativity right }

/// Factorial | Returns the product of the list of integers from 1 to w
/// TODO: Extend to reals and complex numbers with gamma:
///     Gamma(x) = (x - 1)! | x ∊ N
///     Gamma(t) = Integral(0, Inf, (x**(t-1))× **-x, dx) | otherwise
prefix operator ! {}

/// Out of | Yields the number of ways of selecting a things from w.  Useful for producing
/// binomial coefficients.
infix operator ! { associativity right }

/// Power | Returns the exponential of ⍵; that is, e ** ⍵
prefix operator ** {}

/// Power | Returns ⍺ ** ⍵
infix operator ** { associativity right }

/// Log | Returns the natural log of ⍵
prefix operator ⍟ {}

/// Log | Returns the log base ⍺ of ⍵
infix operator ⍟ { associativity right }

/// Pi | Returns pi × w, where pi is the ratio of the circumference of a circle to its diameter.
prefix operator ○ {}

/// Circle | Given some constant k in the range [-15...15], produces several families of related
/// functions.  Trigonometric for k∊1 2 3, hyperbolic for k∊5 6 7, pythagorean for k∊0 4 8, and
/// complex for k∊9 10 11 12.  Negative cases correspond to the inverse of the corresponding
/// positive operation such that ⍵≡k○(-k)○⍵ or ⍵≡(-k)○k○⍵ hold
infix operator ○ { associativity right }

/// Reverse | Reverses the order of a list
prefix operator ⌽ {}

/// Rotate | Cycles the elements of a list.
infix operator ⌽ { associativity right }

/// Roll | Returns a random number from ⍳w
prefix operator ¿ {}

/// Deal | Returns a vector of numbers a long randomly selected from ⍳w.  The returned array will
/// always contain unique numbers.
infix operator ¿ { associativity right }

//prefix operator ⊥ {}
infix operator ⊥ { associativity right }

infix operator ⊤ { associativity right }

// MARK: Logic and Comparison

//prefix operator < {}
//infix operator < { associativity right }
//
//prefix operator ≤ {}
//infix operator ≤ { associativity right }
//
//prefix operator > {}
//infix operator > { associativity right }
//
//prefix operator ≥{}
//infix operator ≥ { associativity right }

//------------------//

//prefix operator = {}
//infix operator = { associativity right }

prefix operator ≠ {}
infix operator ≠ { associativity right }


/// Match | Returns whether the arguments match in shape, size, and boxing structure
infix operator ≡ { associativity right }

/// Not | Negates only boolean arguments
//prefix operator ~ {}

/// Less | Returns an array whose major cells are the major cells of ⍺ less the major cells of ⍵.
infix operator ~ { associativity right }

/// And | Logical AND
/// Least Common Multiple | The least common divisor of ⍺ and ⍵
infix operator ∧ { associativity right }

/// Or | Logical OR
/// Greatest Common Multiple | The greatest common divisor or ⍺ and ⍵
infix operator ∨ { associativity right }

/// Nor | Logical NOR
infix operator ⍱ { associativity right }

/// Nand | Logical NAND
infix operator ⍲ { associativity right }

/// Right | Identity
prefix operator ⊢ {}

/// Right | Yields the argument to its right. aka const
infix operator ⊢ { associativity right }

/// Left | Identity
prefix operator ⊣ {}

/// Left | Yields the argument to its left.  aka flip const
infix operator ⊣ { associativity right }



//------------------//

prefix operator ∊ {}
infix operator ∊ { associativity right }

prefix operator ⍷ {}
infix operator ⍷ { associativity right }

//------------------//


prefix operator ⍳ {}
infix operator ⍳ { associativity right }

prefix operator ⊖ {}
infix operator ⊖ {}

/// Cant | This function reverses the order of axes of its argument.
prefix operator ⍉ {}
//infix operator ⍉ {}


//------------------//


prefix operator ↑ {}
infix operator ↑ { associativity right }

prefix operator ↓ {}
infix operator ↓ { associativity right }

infix operator ⌿ {}

//infix operator ⍸ { associativity right }

prefix operator ⍴ {}
infix operator ⍴ {}

// MARK: Miscellaneous

/// Ravel | "Ravels" (that is, the antonym of unravel) a nested array in normal order.
prefix operator 、{}

/// Table | Cants a and w, concats them together, then cants the result again.
infix operator 、{}

//prefix operator ⍎ {}
//infix operator ⍎ { associativity right }
//
//prefix operator ⍕ {}
//infix operator ⍕ { associativity right }

prefix operator ⍪ {}

/// Over | Concatenates the major cells of a and w
infix operator ⍪ {}

