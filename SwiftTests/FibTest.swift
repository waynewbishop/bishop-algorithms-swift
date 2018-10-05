//
//  MathTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/29/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import XCTest


/*
 note: algorithms associated directly with the Int.swift
 class extension.
*/


@testable import SwiftStructures


class FibTest: XCTestCase {

    
    var count: Int = 0
    

    override func setUp() {
        super.setUp()
    }
    
    
    //MARK: Sequence Based
    

    //iterative technique
    func testFibonnaci() {
        
        let positions: Int = 4
        let results = positions.fibNormal()
        
        //test results
        buildResultsTest(results)
    }
    
    
    
    //recursive technique
    func testFibRecursive() {
        
        var positions: Int = 4
        let results = positions.fibRecursive()
        
        
        //test results
        buildResultsTest(results)
    }
    
    
    
    //closure option
    func testFibClosure() {

        
        let positions: Int = 4
        
        let results = positions.fibClosure { (sequence: Array<Int>!) -> Int in
            
            //initialize and set formula
            let i: Int = sequence.count
            let total: Int = sequence[i - 1] + sequence[i - 2]
            
            return total
            
        }
        
        //test results
        buildResultsTest(results)
        
    }
    
    
    //MARK: Single Answer
    

    
    func testFibExponential() {
        
        let positions: Int = 4
        let result = fibExponential(n: positions)
        
        print("the result is \(result)..")
        print("count is: \(count)")
        
    }
    
    

    func testFibMemoized() {
        
        let positions: Int = 4
        let result = positions.fibMemoized()
        
        //test trivial condition
        if result < 2 {
            XCTFail("Test failed: fib sequence not calculated..")
        }
        
    }
    

    
    
    //MARK: Helper Functions
    
    
    
    //helper function - test results validity
    func buildResultsTest(_ r: Array<Int>!) {

        
        if r == nil {
            XCTFail("fibonnaci test failed..")
        }
        
        
        //check calcuated answer against basic formula..
        if r[r.endIndex - 1] != r[r.endIndex - 2] + r[r.endIndex - 3] {
            XCTFail("fibonnaci test failed..")
        }
        
    }

    
    
    /*
     notes: function included for demonstration purposes and should not be
     considered as best practice.
     */
    
    func fibExponential(n: Int) -> Int {
        
        print("fibExponential called..")
        
        count += 1
        
        if n == 0 {
            return 0
        }
        if n <= 2 {
            return 1
        }
        
        return fibExponential(n: n-1) + fibExponential(n: n-2)
    }

 
}
