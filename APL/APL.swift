//
//  APL.swift
//  APL
//
//  Created by Robert Widmann on 7/14/14.
//  Copyright (c) 2014 Robert Widmann. All rights reserved.
//

import Foundation

//operator prefix + {} Defined by the STL
//operator prefix - {} Defined by the STL

/// Lift equality over arrays.
@infix func ==<T : Equatable>(lhs: Array<T>, rhs: Array<T>) -> Bool {
    if lhs.count == rhs.count {
        for x in (0..<lhs.count) {
            if lhs[x] != rhs[x] {
                return false
            }
        }
        return true
    }
    return false
}

/// Minus
operator prefix - {}

/// Trend | The trend of a number is its sign or zero.
operator prefix × {}

/// Times | Returns the result of e^(log(⍺) - log(1.0 / ⍵)), or the product of two numbers.
operator infix × { associativity right }

/// Per | Returns a result of (1 / ⍵)
operator prefix ÷ {}

/// Per | Returns the result of (⍺ / ⍵)
operator infix ÷ { associativity right }

@prefix func +(w : Double) -> Double {
    return fabs(w)
}

@infix func +(a : Double, w : [Double]) -> [Double] {
    return w.map({$0 + a})
}

@prefix func ÷(w : Double) -> Double {
    return 1 / w
}

@infix func ÷(a : Double, w : Double) -> Double {
    return a / w
}

@prefix func ×(w : Double) -> Double {
    return w ÷ |w
}

@infix func ×(a : Double, w : Double) -> Double {
    return exp(⍟a - ⍟(1.0 / w))
}


//------------------//

/// Power | Returns the exponential of ⍵; that is, e ^ ⍵
operator prefix ^ {}

/// Power | Returns ⍺ ^ ⍵
//operator infix ^ { associativity right }

/// Log | Returns the natural log of ⍵
operator prefix ⍟ {}

/// Log | Returns the log base ⍺ of ⍵
operator infix ⍟ { associativity right }

@prefix func ^(w : Double) -> Double {
    return exp(w)
}

@infix func ^(a : Double, w : Double) -> Double {
    return ^w × ⍟a
}

@prefix func ⍟(w : Double) -> Double {
    return log(w)
}

@infix func ⍟(a : Double, w : Double) -> Double {
    return ^w ^ ⍟a
}

//------------------//

//operator prefix < {}
//operator infix < { associativity right }
//
//operator prefix ≤ {}
//operator infix ≤ { associativity right }
//
//operator prefix > {}
//operator infix > { associativity right }
//
//operator prefix ≥{}
//operator infix ≥ { associativity right }

//------------------//

//operator prefix = {}
//operator infix = { associativity right }

operator prefix ≠ {}
operator infix ≠ { associativity right }

@prefix func ≠<T : Hashable>(w : [T]) -> [Int] {
    var dict = Dictionary<T, Void>()
    return w.map() {
        if dict.indexForKey($0) {
            return 0
        }
        dict.updateValue(Void(), forKey: $0)
        return 1
    }
}

//operator prefix ≡ {}
//operator infix ≡ { associativity right }

//------------------//

/// Not | Negates only boolean arguments
operator prefix ~ {}
//operator infix ~ { associativity right }

@prefix func ~(x : Bool) -> Bool {
    return !x
}

//------------------//

/// And | Logical AND
/// Least Common Multiple | The least common divisor of ⍺ and ⍵
operator infix ∧ { associativity right }

/// Or | Logical OR
/// Greatest Common Multiple | The greatest common divisor or ⍺ and ⍵
operator infix ∨ { associativity right }

/// Nor | Logical NOR
operator infix ⍱ { associativity right }

/// NAnd | Logical NAND
operator infix ⍲ { associativity right }

@infix func ∧(a : UInt, w : UInt) -> UInt {
    return (w / (a ∨ w)) ^ a
}

@infix func ∧(a : Bool, w : Bool) -> Bool {
    return a && w
}

@infix func ∨(a : UInt, w : UInt) -> UInt {
    var al : UInt = a
    var b : UInt = w
    var c : UInt
    while a != 0 {
        c = al
        al = b % a
        b = c
    }
    return w
}

@infix func ∨(a : Bool, w : Bool) -> Bool {
    return a || w
}

@infix func ⍱(a : Bool, w : Bool) -> Bool {
    return (~a ∨ w)
}

@infix func ⍲(a : Bool, w : Bool) -> Bool {
    return (~a ∧ w)
}

//------------------//

/// Right | Identity
operator prefix ⊢ {}

/// Right | Yields the argument to its right. aka const
operator infix ⊢ { associativity right }

/// Left | Identity
operator prefix ⊣ {}

/// Left | Yields the argument to its left.  aka flip const
operator infix ⊣ { associativity right }


@prefix func ⊢<T>(w : T) -> T {
    return w
}

@infix func ⊢<T, V>(a : T, w : V) -> T {
    return a
}

@prefix func ⊣<T>(w : T) -> T {
    return w
}

@infix func ⊣<T, V>(a : V, w : T) -> T {
    return w
}

//------------------//

//operator prefix ⊥ {}
//operator infix ⊥ { associativity right }
//
//operator prefix ⊤ {}
//operator infix ⊤ { associativity right }
//
//operator prefix ⍎ {}
//operator infix ⍎ { associativity right }
//
//operator prefix ⍕ {}
//operator infix ⍕ { associativity right }

//------------------//

operator prefix ○ {}
operator infix ○ { associativity right }

operator prefix ⌽ {}
operator infix ⌽ { associativity right }


@prefix func ○(w : Double) -> Double {
    return M_PI × w
}

@prefix func ⌽<T>(w : [T]) -> [T] {
    return w.reverse()
}

@infix func ⌽<T>(a : Int, w : [T]) -> [T] {
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

operator prefix ⊖ {}
operator infix ⊖ {}

//@prefix func ⊖<T>(w : [T]) -> [T] {
//    return (⍉(⌽(⍉w)))
//}

//@infix func ⊖<T>(a : [Int], w : [T]) -> [T] {
//    return (⌽(¨(a ⍉ w)))
//}

operator prefix ⍉ {}
operator infix ⍉ {}

//@prefix func ⍉<T>(w : [T]) -> [T] {
//    //return (⌽(⍳0)){⍴⍴w)⍉w
//}

//------------------//

operator prefix | {}
operator infix | { associativity right }

@prefix func |(w : Double) -> Double {
    return fabs(w)
}

@infix func |(a : Double, w : Double) -> Double {
    return fmod(a, w)
}


operator prefix ! {}
operator infix ! { associativity right }

//@prefix func !(w : Int) -> Int {
//    return ×/ (1 + (⍳ w))
//}
//
//@infix func !(a : Int, w : Int) -> Int {
//    return Double(!w) ÷ Double(!a) × Double((!w) - a)
//}


//------------------//

operator prefix ⌊ {}
operator infix ⌊ { associativity right }

operator prefix ⌈ {}
operator infix ⌈ { associativity right }

@prefix func ⌊(w : Double) -> Double {
    return floor(w)
}

@infix func ⌊(a : Double, w : Double) -> Double {
    return (a < w) ? a : w
}

@prefix func ⌈(w : Double) -> Double {
    return ceil(w)
}

@infix func ⌈(a : Double, w : Double) -> Double {
    return (a > w) ? a : w
}

//------------------//

operator prefix ↑ {}
operator infix ↑ { associativity right }

operator prefix ↓ {}
operator infix ↓ { associativity right }

operator infix ⌿ {}


//------------------//


@infix func ⌿<T>(a : [Int], w : [T]) -> [T] {
    var arr = Array<T>()
    for i in (0..<w.count) {
        var j = 0
        while j++ < a[i] {
            arr.append(w[i])
        }
    }
    return arr
}

@infix func ⌿<T>(a : Int, w : [T]) -> [T] {
    var arr = Array<T>()
    for x in w {
        var i = 0
        while i++ < a {
            arr.append(x)
        }
    }
    return arr
}

@infix func ⌿<T>(a : [Int], w : T) -> [T] {
    return Array<T>(count: a.reduce(0, combine:(+)), repeatedValue: w)
}

@prefix func ↑<T : Hashable>(w : [T]) -> [T] {
    return (≠w) ⌿ w
}
