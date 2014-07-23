//
//  Complex.swift
//  APL
//
//  Created by Robert Widmann on 7/23/14.
//  Copyright (c) 2014 Robert Widmann. All rights reserved.
//

import Foundation

struct Complex {
    let real : Double = 0.0
    let imag : Double = 0.0
    
    var inverse : Complex {
    var denom = real * real + imag * imag
        return Complex(real: real ÷ denom, imag: -imag ÷ denom)
    }
    
}

operator infix ⊹ {}

@infix func ⊹(a : Double, w : Double) -> Complex {
    return Complex(real: a, imag: w)
}

@infix func + (a : Complex, w : Complex) -> Complex {
    return Complex(real: a.real + w.real, imag: a.imag + w.imag)
}

@prefix func - (w : Complex) -> Complex {
    return Complex(real: -w.real, imag: -w.imag)
}

@infix func - (a : Complex, w : Complex) -> Complex {
    return Complex(real: a.real - w.real, imag: a.imag - w.imag)
}

@infix func × (a : Complex, w : Complex) -> Complex {
    return Complex(real: (a.real × w.real) - (a.imag × w.imag), imag: (a.real × w.imag) + (a.imag × w.real))
}

@infix func ÷ (a : Complex, w : Complex) -> Complex {
    return a × w.inverse
}

@infix func + (a : Double, w : Complex) -> Complex {
    return Complex(real: a + w.real, imag: w.imag)
}

@infix func - (a : Double, w : Complex) -> Complex {
    return Complex(real: a - w.real, imag: w.imag)
}

@infix func × (a : Double, w : Complex) -> Complex {
    return Complex(real: a × w.real, imag: a × w.imag)
}

@infix func ÷ (a : Double, w : Complex) -> Complex {
    return a × w.inverse
}
