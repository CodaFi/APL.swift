//
//  Adverbs.swift
//  APL
//
//  Created by Robert Widmann on 7/23/14.
//  Copyright (c) 2014 Robert Widmann. All rights reserved.
//

import Foundation


/// Swap | Applies w and a to a verb on the left.
operator infix ⊂ {}

@infix public func ⊂<T, U>(f : U -> T, w : U) -> T {
    return f(w)
}

@infix public func ⊂<T>(f : T -> T -> T, w : T) -> T {
    return f(w)(w)
}
