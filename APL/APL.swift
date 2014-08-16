//
//  APL.swift
//  APL
//
//  Created by Robert Widmann on 7/14/14.
//  Copyright (c) 2014 Robert Widmann. All rights reserved.
//

import Foundation


// MARK: Math


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


prefix public func |(w : Double) -> Double {
	return fabs(w)
}

prefix public func |(w : Complex) -> Double {
	return hypot(w.real, w.imag)
}

public func |(a : Double, w : Double) -> Double {
	return fmod(a, w)
}

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

public func ⊤(a : UInt, w : UInt) -> Double {
	return Double(a % w)
}

//public func ⊥(a : UInt, w : UInt) -> Double {
//	let W = 1+(⌽(×\(⌽(a、1)))
//}

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

public func ~<T : Hashable>(a : [T], w : [T]) -> [T] {
	var dict = Dictionary<T, Void>()
	for x in w {
		dict.updateValue(Void(), forKey: x)
	}
	return a.filter() {
		return dict.indexForKey($0) == nil
	}
}



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

/// Upset | Overturns w.
public prefix func ⊖<T>(w : [T]) -> [T] {
	return (⍉(⌽(⍉w)))
}

//public func ⊖<T>(a : [Int], w : [T]) -> [T] {
//    return (⌽¨(⍉w))
//}

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


//------------------//


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


prefix public func ⍳(w : Int) -> [Int] {
	return Array<Int>((0..<w))
}

prefix public func ⍳(w : Double) -> [Double] {
	return Array<Double>(stride(from: 0.0, to: w, by: 1.0))
}


//public func ⍳<T : Hashable>(a : [T], w : [T]) -> T {
//	return ((+) / ((∧⧵(≠w))))
//}


//public func ⍸<T>(a : [T], w : [T]) {
//
//}


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

//prefix public func ⍪<T>(w : [T]) -> [T] {
//	return ،⍤¯1،⍤¯1 w
//}

public func ⍪<T>(a : [T], w : [T]) -> [T] {
	var arr = a
	arr += w
	return arr
}
