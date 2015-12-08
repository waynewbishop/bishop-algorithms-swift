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
        
        let positions: Int = 2
        let results: Array<Int>? = Math.fib(positions)
        
        //test results
        buildResultsTest(results)
        
    }

    
    //recursive option
    func testFibRecursive() {
    
        let positions: Int = 4
        
        let results: Array<Int>? =  Math.fibRecursive(positions)

        //test results
        buildResultsTest(results)
        
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
        buildResultsTest(results)
        
    }
    

    
    
    //helper function - test results validity
    func buildResultsTest(r: Array<Int>?) {

        guard let r = r where r.count >= 2 else {    // guard that r is not nil and contains at least 2 elements.
            XCTFail("fibonnaci test failed..")
            return
        }

        let fibGenerator = fibSequence.generate()
        
        XCTAssertFalse( r.contains { $0 != fibGenerator.next() },   // Results should not contain any element != generated from fibGenerator
            "fibonnaci test failed.."
        )
    }
    
 
}
