//
//  BooleanArithmeticSpec.swift
//  APL
//
//  Created by Robert Widmann on 7/14/14.
//  Copyright (c) 2014 Robert Widmann. All rights reserved.
//

import Foundation
import XCTest
import APL

class BooleanArithmeticSpec : XCTestCase {
    func testDyadMatch() {
        let x = ["a", "a", "a", "a", "a", "a"]
        let y = ["a", "a", "a", "a", "a", "a"]
        let z = ["b", "a", "a", "a", "a", "a"]
        
        XCTAssertTrue(x≡y, "")
        XCTAssertTrue(y≡x, "")
        XCTAssertFalse(z≡x, "")
    }
    
    func testMonadNot() {
        let x = true
        let y = false
        
        XCTAssertFalse(~x, "")
        XCTAssertTrue(~y, "")
    }
    
    func testMonadAND() {
        let x = true
        let y = false
        
        XCTAssertTrue(x ∧ x, "")
        XCTAssertFalse(x ∧ y, "")
        XCTAssertFalse(y ∧ y, "")
    }
    
    func testMonadOR() {
        let x = true
        let y = false
        
        XCTAssertTrue(x ∨ x, "")
        XCTAssertTrue(x ∨ y, "")
        XCTAssertFalse(y ∨ y, "")
    }
    
    func testMonadNAND() {
        let x = true
        let y = false
        
        XCTAssertFalse(x ⍲ x, "")
        XCTAssertTrue(x ⍲ y, "")
        XCTAssertTrue(y ⍲ y, "")
    }
    
    func testMonadNOR() {
        let x = true
        let y = false
        
        XCTAssertFalse(x ⍱ x, "")
        XCTAssertFalse(x ⍱ y, "")
        XCTAssertTrue(y ⍱ y, "")
    }
}
