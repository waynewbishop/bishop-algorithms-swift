//
//  MathTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/29/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures



class MathTest: XCTestCase {
    
    /*
        fibSequence will be used in order to generate Fibonacci generators
        a Fibonacci generator will generate the next Fibonacci number starting from 0
        until overflaw crash (i.e.: it will never return nil)
    */
    let fibSequence: AnySequence<Int> = {
        return AnySequence { _ -> AnyGenerator<Int> in
            var state = (0, 1)
            return anyGenerator {
                let result = state.0
                state = (state.1, state.0 + state.1)
                return result
            }
        }
    }()
    
    override func setUp() {
        super.setUp()
    }
    

    //published example - default option
    func testFibonnaci() {
        
        
        //test results
        XCTAssertFalse(isFibonacci(Math.fib(1)), "1 fibonnaci test failed.. Should return nil")
        XCTAssertTrue(isFibonacci(Math.fib(2)), "2 fibonnaci test failed..")
        XCTAssertTrue(isFibonacci(Math.fib(4)), "4 fibonnaci test failed..")
    }

    
    //recursive option
    func testFibRecursive() {
    

        //test results
        XCTAssertFalse(isFibonacci(Math.fibRecursive(1)), "Recursive 1 fibonnaci test failed.. Should return nil")
        XCTAssertTrue(isFibonacci(Math.fibRecursive(2)), "Recursive 2 fibonnaci test failed..")
        XCTAssertTrue(isFibonacci(Math.fibRecursive(4)), "Recursive 4 fibonnaci test failed..")
        
    }
    
    
    
    //closure option
    func testFibClosure() {
        
        let positions: Int = 23

        
        let results: Array<Int>? = Math.fib(positions) { (sequence: Array<Int>) -> Int in
            
            //initialize and set formula
            let i: Int = sequence.count
            let total: Int = sequence[i - 1] + sequence[i - 2]
            
            return total
        }
        

        //test results
        XCTAssertTrue(isFibonacci(results), "Closure fibonnaci test failed..")
        
    }
    

    
    
    //helper function - test results validity
    func isFibonacci(r: Array<Int>?) -> Bool {

        guard let r = r where r.count >= 2 else {           // guard that r is not nil and contains at least 2 elements.
            return false
        }

        let fibGenerator = fibSequence.generate()
        
        return !r.contains { $0 != fibGenerator.next() }    // Results should not contain any element != generated from fibGenerator
    }
    
 
}
