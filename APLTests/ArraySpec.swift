//
//  ArraySpec.swift
//  APL
//
//  Created by Robert Widmann on 7/14/14.
//  Copyright (c) 2014 Robert Widmann. All rights reserved.
//

import Foundation
import XCTest
import Swift
import APL

class ArraySpec : XCTestCase {
    func testMonadIota() {
        let x = ⍳5
        let y = ⍳8
        let z = ⍳1

        XCTAssertTrue(x ≡ [0, 1, 2, 3, 4], "")
        XCTAssertTrue(y ≡ [0, 1, 2, 3, 4, 5, 6, 7], "")
        XCTAssertTrue(z ≡ [0], "")
    }
    
    func testDimensions() {
        let x = [1, 2, 3, 4]
        let y = [[1, 2, 3, 4],
                 [4, 5, 6, 7]]
        let z = [[[1, 2, 3, 4],
                  [4, 5, 6, 7]],
                 [[1, 2, 3, 4],
                 [4, 5, 6, 7]]]
        XCTAssertTrue(⍴x ≡ [4], "")
        XCTAssertTrue(⍴y ≡ [4, 2], "")
        XCTAssertTrue(⍴z ≡ [4, 2, 2], "")
    }
}

