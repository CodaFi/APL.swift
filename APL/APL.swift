//
//  APL.swift
//  APL
//
//  Created by Robert Widmann on 7/14/14.
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

prefix public func +(w : Double) -> Double {
	return fabs(w)
}

public func +(a : Int, w : [Int]) -> [Int] {
	return w.map({$0 + a})
}

public func +(a : Double, w : [Double]) -> [Double] {
	return w.map({$0 + a})
}

prefix public func ÷(w : Double) -> Double {
	return 1 / w
}

public func ÷(a : Double, w : Double) -> Double {
	return a / w
}

prefix public func ×(w : Double) -> Double {
	return w ÷ |w
}

public func ×(a : Double, w : Double) -> Double {
	return exp(⍟a - ⍟(1.0 / w))
}

/// Floor | Gives the floor or integer part of w
prefix operator ⌊ {}

/// Minimum | Yields the lesser of a and w
infix operator ⌊ { associativity right }

/// Ceiling | Rounds upward, then yields the integer part of w
prefix operator ⌈ {}

/// Maximum | Yields the greater of a and w
infix operator ⌈ { associativity right }

prefix public func ⌊(w : Double) -> Double {
	return floor(w)
}

public func ⌊(a : Double, w : Double) -> Double {
	return (a < w) ? a : w
}

prefix public func ⌈(w : Double) -> Double {
	return ceil(w)
}

public func ⌈(a : Double, w : Double) -> Double {
	return (a > w) ? a : w
}

/// Size | Yields the size or "absolute value" for a real or complex argument.
prefix operator | {}

/// Residue | TODO: Relax definition from fmod to "tolerant" residue
/// ⍺|⍵ ←→ ⍵-⍺×⌊s   if (⍺≠0)^(⌈s)≠⌊s←⍵÷⍺+⍺=0
///     ←→ ⍵×⍺=0    otherwise
infix operator | { associativity right }

prefix public func |(w : Double) -> Double {
	return fabs(w)
}

prefix public func |(w : Complex) -> Double {
	return hypot(w.real, w.imag)
}

public func |(a : Double, w : Double) -> Double {
	return fmod(a, w)
}


/// Factorial | Returns the product of the list of integers from 1 to w
/// TODO: Extend to reals and complex numbers with gamma:
///     Gamma(x) = (x - 1)! | x ∊ N
///     Gamma(t) = Integral(0, Inf, (x**(t-1))× **-x, dx) | otherwise
prefix operator ! {}

/// Out of | Yields the number of ways of selecting a things from w.  Useful for producing
/// binomial coefficients.
infix operator ! { associativity right }

prefix public func !(w : Int) -> Double {
	var acc : Int = 1
	for i in (1 + (⍳w)) {
		acc *= i
	}
	return Double(acc)
}


public func !(a : Int, w : Int) -> Double {
	return !w ÷ !a × (!w - Double(a))
}

public func !(a : [Int], w : Int) -> [Double] {
	return a.map({$0 ! w})
}

/// Power | Returns the exponential of ⍵; that is, e ** ⍵
prefix operator ** {}

/// Power | Returns ⍺ ** ⍵
infix operator ** { associativity right }

/// Log | Returns the natural log of ⍵
prefix operator ⍟ {}

/// Log | Returns the log base ⍺ of ⍵
infix operator ⍟ { associativity right }

prefix public func **(w : Double) -> Double {
	return exp(w)
}

public func **(a : Double, w : Double) -> Double {
	return **(w × ⍟a)
}

prefix public func ⍟(w : Double) -> Double {
	return log(w)
}

public func ⍟(a : Double, w : Double) -> Double {
	return **w ** ⍟a
}

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


prefix public func ○(w : Double) -> Double {
	return M_PI × w
}

public func ○(l : Int, w : Double) -> Complex {
	switch l {
		case 0:
			return ((1 - w * 2) * 0.5)⊹0
		case 1:
			return sin(w)⊹0
		case 2:
			return cos(w)⊹0
		case 3:
			return tan(w)⊹0
		case -1:
			return asin(w)⊹0
		case -2:
			return acos(w)⊹0
		case -3:
			return atan(w)⊹0
		case 4:
			return ((1 + w * 2) * 0.5)⊹0
		case -4:
			return ((-1 + w * 2) * 0.5)⊹0
		case 5:
			return sinh(w)⊹0
		case 6:
			return cosh(w)⊹0
		case 7:
			return tanh(w)⊹0
		case -5:
			return asinh(w)⊹0
		case -6:
			return acosh(w)⊹0
		case -7:
			return atanh(w)⊹0
		case 8:
			return ((-1 - w * 2) * 0.5)⊹0
		case -8:
			return (-(-1 - w * 2) * 0.5)⊹0
		case 9:
			return ((w + +w) ÷ 2)⊹0
		case 10:
			return |w ⊹ 0
		case 11:
			return (w - +w) ÷ (0⊹2)
		case -9:
			return w⊹0
		case -10:
			return (+w)⊹0
		case -11:
			return **w × (0⊹1)
		case 12:
			return (⍟(×w)) ÷ (0⊹1)
		case -12:
			return **w × (0⊹1)
		case 13:
			return w⊹0
		case 14:
			return **w ⊹ 0
		case 15:
			return **w × (0⊹1)
		case -13:
			return w⊹0
		case -14:
			return ⍟w ⊹ 0
		case -15:
			return ⍟w × -(0⊹2)
		default:
			break
	}
	println("Invalid argument passed to Circle \(w)")
	assert(false, "")
	return Complex()
}

/// Roll | Returns a random number from ⍳w
prefix operator ¿ {}

/// Deal | Returns a vector of numbers a long randomly selected from ⍳w.  The returned array will
/// always contain unique numbers.
infix operator ¿ { associativity right }

prefix public func ¿(w : UInt) -> Double {
	return Double(arc4random()) | Double(w)
}

public func ¿(a : UInt, w : UInt) -> [Double] {
	var indices = Dictionary<Double, Void>()
	while UInt(indices.count) != a {
		indices.updateValue(Void(), forKey: ¿w)
	}
	return Array<Double>(indices.keys)
}

//------------------//

//prefix operator ⊥ {}
infix operator ⊥ { associativity right }

//public func ⊥(a : UInt, w : UInt) -> Double {
//	let W = 1+(⌽(×\(⌽(a、1)))
//}


infix operator ⊤ { associativity right }

public func ⊤(a : UInt, w : UInt) -> Double {
	return Double(a % w)
}

//------------------//


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

prefix public func ≠<T : Hashable>(w : [T]) -> [Int] {
	var dict = Dictionary<T, Void>()
	return w.map() {
		if dict.indexForKey($0) != nil {
			return 0
		}
		dict.updateValue(Void(), forKey: $0)
		return 1
	}
}

/// Match | Returns whether the arguments match in shape, size, and boxing structure
infix operator ≡ { associativity right }

public func ≡<T : Equatable>(a : T, w : T) -> Bool {
	return a == w 
}

/// Lift equality over arrays.
public func ≡<T : Equatable>(a : [T], w : [T]) -> Bool {
	if a.count == w.count {
		for x in (0..<a.count) {
			if a[x] != w[x] {
				return false
			}
		}
		return true
	}
	return false
}

/// Not | Negates only boolean arguments
//prefix operator ~ {}

/// Less | Returns an array whose major cells are the major cells of ⍺ less the major cells of ⍵.
infix operator ~ { associativity right }

public func ~<T : Hashable>(a : [T], w : [T]) -> [T] {
	var dict = Dictionary<T, Void>()
	for x in w {
		dict.updateValue(Void(), forKey: x)
	}
	return a.filter() {
		return dict.indexForKey($0) == nil
	}
}


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

public func ∧(a : UInt, w : UInt) -> Double {
	return Double(Double(w) / (a ∨ w)) ** Double(a)
}

public func ∧(a : Bool, w : Bool) -> Bool {
	return a && w
}

public func ∨(a : UInt, w : UInt) -> Double {
	var al : UInt = a
	var b : UInt = w
	var c : UInt
	while a != 0 {
		c = al
		al = b % a
		b = c
	}
	return Double(w)
}

public func ∨(a : Bool, w : Bool) -> Bool {
	return a || w
}

public func ⍱(a : Bool, w : Bool) -> Bool {
	return ~(a ∨ w)
}

public func ⍲(a : Bool, w : Bool) -> Bool {
	return ~(a ∧ w)
}

// MARK: Selection and Set Operations

/// Right | Identity
prefix operator ⊢ {}

/// Right | Yields the argument to its right. aka const
infix operator ⊢ { associativity right }

/// Left | Identity
prefix operator ⊣ {}

/// Left | Yields the argument to its left.  aka flip const
infix operator ⊣ { associativity right }


prefix public func ⊢<T>(w : T) -> T {
	return w
}

public func ⊢<T, V>(a : T, w : V) -> T {
	return a
}

prefix public func ⊣<T>(w : T) -> T {
	return w
}

public func ⊣<T, V>(a : V, w : T) -> T {
	return w
}


// MARK: Structural


prefix public func ⌽<T>(w : [T]) -> [T] {
	return w.reverse()
}

public func ⌽<T>(a : Int, w : [T]) -> [T] {
	if ×Double(a) == 0.0 {
		return w
	} else if ×Double(a) == 1.0 {
		var x = Array<T>(w[a..<w.count])
		x.extend(w[0..<a])
		return x
	}
	var x = Array<T>(w[(w.count + a)..<w.count])
	x.extend(w[0..<(w.count + a)])
	return x
}


//------------------//

prefix operator ⊖ {}
infix operator ⊖ {}

//public func ⊖<T>(w : [T]) -> [T] {
//    return (⍉(⌽(⍉w)))
//}

//public func ⊖<T>(a : [Int], w : [T]) -> [T] {
//    return (⌽(¨(a ⍉ w)))
//}

/// Cant | This function reverses the order of axes of its argument.
prefix operator ⍉ {}

//infix operator ⍉ {}

prefix public func ⍉<T>(w : [T]) -> [T] {
	return w
}

prefix public func ⍉<T>(w : [[T]]) -> [[T]] {
	var ar : [[T]] = [[]]
	for i in 0...w[0].count {
		for j in 0...w.count {
			ar[i][j] = w[w.count - 1 - j][i];
		}
	}
	return ar
}


prefix operator ↑ {}
infix operator ↑ { associativity right }

prefix operator ↓ {}
infix operator ↓ { associativity right }

infix operator ⌿ {}


//------------------//

prefix public func ↑<T : Hashable>(w : [T]) -> [T] {
	return (≠w) ⌿ w
}

public func ⌿<T>(a : [Int], w : [T]) -> [T] {
	var arr = Array<T>()
	for i in (0..<w.count) {
		var j = 0
		while j++ < a[i] {
			arr.append(w[i])
		}
	}
	return arr
}

public func ⌿<T>(a : Int, w : [T]) -> [T] {
	var arr = Array<T>()
	for x in w {
		var i = 0
		while i++ < a {
			arr.append(x)
		}
	}
	return arr
}

public func ⌿<T>(a : [Int], w : T) -> [T] {
	return Array<T>(count: a.reduce(0, combine:(+)), repeatedValue: w)
}

//------------------//

prefix operator ∊ {}
infix operator ∊ { associativity right }

prefix operator ⍷ {}
infix operator ⍷ { associativity right }

//------------------//


prefix operator ⍳ {}
infix operator ⍳ { associativity right }

prefix public func ⍳(w : Int) -> [Int] {
	return Array<Int>((0..<w))
}

//public func ⍳<T>(a : [T], w : T) -> [T] {
//    return +/ ∧\a∘.(≠w)
//}

//infix operator ⍸ { associativity right }
//
//public func ⍸<T>(a : [T], w : [T]) {
//
//}

prefix operator ⍴ {}
infix operator ⍴ {}

prefix public func ⍴<T>(w : [T]) -> [Int] {
	return [w.count]
}

prefix public func ⍴<T>(w : [[T]]) -> [Int] {
	var ar = ⍴(w[0])
	ar.append(w.count)
	return ar
}

prefix public func ⍴<T>(w : [[[T]]]) -> [Int] {
	var ar = ⍴(w[0])
	ar.append(w.count)
	return ar
}

prefix public func ⍴<T>(w : [[[[T]]]]) -> [Int] {
	var ar = ⍴(w[0])
	ar.append(w.count)
	return ar
}

prefix public func ⍴<T>(w : [[[[[T]]]]]) -> [Int] {
	var ar = ⍴(w[0])
	ar.append(w.count)
	return ar
}

// MARK: Miscellaneous

/// Ravel | "Ravels" (that is, the antonym of unravel) a nested array in normal order.
prefix operator 、{}

/// Table | Cants a and w, concats them together, then cants the result again.
infix operator 、{}

prefix public func 、<T>(w : [[T]]) -> [T] {
	var ar : [T] = []
	for x in w {
		ar += x
	}
	return ar
}

prefix public func 、<T>(w : [[[T]]]) -> [T] {
	var ar : [T] = []
	for x in w {
		ar += 、x
	}
	return ar
}

prefix public func 、<T>(w : [[[[T]]]]) -> [T] {
	var ar : [T] = []
	for x in w {
		ar += 、x
	}
	return ar
}

prefix public func 、<T>(w : [[[[[T]]]]]) -> [T] {
	var ar : [T] = []
	for x in w {
		ar += 、x
	}
	return ar
}

public func 、<T>(a : [T], w : [T]) -> [T] {
	return ⍉((⍉a)⍪(⍉w))
}

public func 、<T>(a : [[T]], w : [[T]]) -> [[T]] {
	return ⍉((⍉a)⍪(⍉w))
}

//prefix operator ⍎ {}
//infix operator ⍎ { associativity right }
//
//prefix operator ⍕ {}
//infix operator ⍕ { associativity right }

prefix operator ⍪ {}

/// Over | Concatenates the major cells of a and w
infix operator ⍪ {}

//prefix public func ⍪<T>(w : [T]) -> [T] {
//	return ،⍤¯1،⍤¯1 w
//}

public func ⍪<T>(a : [T], w : [T]) -> [T] {
	var arr = a
	arr += w
	return arr
}
