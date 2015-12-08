//
//  MathTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/29/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


private var math: Math = Math()


class MathTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    

    //published example - default option
    func testFibonnaci() {
        
        let positions: Int = 2
        let results: Array<Int>? = math.fib(positions)
        
        //test results
        buildResultsTest(results)
        
    }

    
    //recursive option
    func testFibRecursive() {
    
        let positions: Int = 4
        
        let results: Array<Int>? =  math.fibRecursive(positions)

        //test results
        buildResultsTest(results)
        
    }
    
    
    
    //closure option
    func testFibClosure() {
        
        let positions: Int = 23

        
        let results: Array<Int>? = math.fib(positions) { (sequence: Array<Int>) -> Int in
            
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

        if r.count < 3 {
            XCTAssertTrue(r.elementsEqual([0, 1]))
        } else {
            XCTAssertTrue(r[r.endIndex - 1] == r[r.endIndex - 2] + r[r.endIndex - 3])
        }
        
    }
    
 
}
