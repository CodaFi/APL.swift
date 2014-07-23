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

/// Minus
operator prefix - {}

/// Trend | The trend of a number is its sign or zero.
operator prefix × {}

/// Times | Returns the result of e**(log(⍺) - log(1.0 / ⍵)), or the product of two numbers.
operator infix × { associativity right }

/// Per | Returns a result of (1 / ⍵)
operator prefix ÷ {}

/// Per | Returns the result of (⍺ / ⍵)
operator infix ÷ { associativity right }

@prefix func +(w : Double) -> Double {
    return fabs(w)
}

@infix func +(a : Int, w : [Int]) -> [Int] {
    return w.map({$0 + a})
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

/// Power | Returns the exponential of ⍵; that is, e ** ⍵
operator prefix ** {}

/// Power | Returns ⍺ ** ⍵
operator infix ** { associativity right }

/// Log | Returns the natural log of ⍵
operator prefix ⍟ {}

/// Log | Returns the log base ⍺ of ⍵
operator infix ⍟ { associativity right }

@prefix func **(w : Double) -> Double {
    return exp(w)
}

@infix func **(a : Double, w : Double) -> Double {
    return **w × ⍟a
}

@prefix func ⍟(w : Double) -> Double {
    return log(w)
}

@infix func ⍟(a : Double, w : Double) -> Double {
    return **w ** ⍟a
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

/// Match | Returns whether the arguments match in shape, size, and boxing structure
operator infix ≡ { associativity right }

@infix func ≡<T : Equatable>(a : T, w : T) -> Bool {
    return a == w 
}

/// Lift equality over arrays.
@infix func ≡<T : Equatable>(a : [T], w : [T]) -> Bool {
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

//------------------//

/// Not | Negates only boolean arguments
//operator prefix ~ {}

/// Less | Returns an array whose major cells are the major cells of ⍺ less the major cells of ⍵.
operator infix ~ { associativity right }

@infix func ~<T : Hashable>(a : [T], w : [T]) -> [T] {
    var dict = Dictionary<T, Void>()
    for x in w {
        dict.updateValue(Void(), forKey: x)
    }
    return a.filter() {
       return dict.indexForKey($0) == nil
    }
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

/// Nand | Logical NAND
operator infix ⍲ { associativity right }

@infix func ∧(a : UInt, w : UInt) -> Double {
    return Double(Double(w) / (a ∨ w)) ** Double(a)
}

@infix func ∧(a : Bool, w : Bool) -> Bool {
    return a && w
}

@infix func ∨(a : UInt, w : UInt) -> Double {
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

@infix func ∨(a : Bool, w : Bool) -> Bool {
    return a || w
}

@infix func ⍱(a : Bool, w : Bool) -> Bool {
    return ~(a ∨ w)
}

@infix func ⍲(a : Bool, w : Bool) -> Bool {
    return ~(a ∧ w)
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

/// Pi | Returns pi × w, where pi is the ratio of the circumference of a circle to its diameter.
operator prefix ○ {}

/// Circle | Given some constant k in the range [-15...15], produces several families of related
/// functions.  Trigonometric for k∊1 2 3, hyperbolic for k∊5 6 7, pythagorean for k∊0 4 8, and 
/// complex for k∊9 10 11 12.  Negative cases correspond to the inverse of the corresponding
/// positive operation such that ⍵≡k○(-k)○⍵ or ⍵≡(-k)○k○⍵ hold
operator infix ○ { associativity right }

/// Reverse | Reverses the order of a list
operator prefix ⌽ {}

/// Rotate | Cycles the elements of a list.
operator infix ⌽ { associativity right }


@prefix func ○(w : Double) -> Double {
    return M_PI × w
}

@infix func ○(l : Int, w : Double) -> Complex {
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

/// Size | Yields the size or "absolute value" for a real or complex argument.
operator prefix | {}

/// Residue | TODO: Relax definition from fmod to "tolerant" residue
/// ⍺|⍵ ←→ ⍵-⍺×⌊s   if (⍺≠0)^(⌈s)≠⌊s←⍵÷⍺+⍺=0
///     ←→ ⍵×⍺=0    otherwise
operator infix | { associativity right }

@prefix func |(w : Double) -> Double {
    return fabs(w)
}

@prefix func |(w : Complex) -> Double {
    return hypot(w.real, w.imag)
}

@infix func |(a : Double, w : Double) -> Double {
    return fmod(a, w)
}


/// Factorial | Returns the product of the list of integers from 1 to w
/// TODO: Extend to reals and complex numbers with gamma:
///     Gamma(x) = (x - 1)! | x ∊ N
///     Gamma(t) = Integral(0, Inf, (x**(t-1))× **-x, dx) | otherwise
operator prefix ! {}

/// Out of | Yields the number of ways of selecting a things from w.  Useful for producing
/// binomial coefficients.
operator infix ! { associativity right }

@prefix func !(w : Int) -> Double {
    var acc : Int = 1
    for i in (1 + (⍳w)) {
        acc *= i
    }
    return Double(acc)
}


@infix func !(a : Int, w : Int) -> Double {
    return !w ÷ !a × (!w - Double(a))
}

@infix func !(a : [Int], w : Int) -> [Double] {
    return a.map({$0 ! w})
}

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

//------------------//


operator prefix ⍳ {}
operator infix ⍳ { associativity right }

@prefix func ⍳(w : Int) -> [Int] {
    return Array<Int>((0..<w))
}

//@infix func ⍳<T>(a : [T], w : T) -> [] {
//    return +/∧\a∘.≠w
//}

//operator infix ⍸ { associativity right }
//
//@infix func ⍸<T>(a : [T], w : [T]) {
//
//}

operator prefix ⍴ {}
operator infix ⍴ {}

@prefix func ⍴<T>(w : [T]) -> [Int] {
    return [w.count]
}

@prefix func ⍴<T>(w : [[T]]) -> [Int] {
    var ar = ⍴(w[0])
    ar.append(w.count)
    return ar
}

@prefix func ⍴<T>(w : [[[T]]]) -> [Int] {
    var ar = ⍴(w[0])
    ar.append(w.count)
    return ar
}

//...
