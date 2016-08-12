//
//  MathTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/29/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import XCTest

/*
 note: fibonacci algorithms are associated directly with the Int.swift
 class an an extension.
*/


@testable import SwiftStructures


class MathTest: XCTestCase {
    

    override func setUp() {
        super.setUp()
    }
    

    //published example - default option
    func testFibonnaci() {
        
        let positions: Int = 4
        let results = positions.fibNormal()
        
        //test results
        buildResultsTest(results)
        
    }
    
    
    
    //recursive option
    func testFibRecursive() {
        
        var positions: Int = 4
        let results = positions.fibRecursive()
        
        
        //test results
        buildResultsTest(results)
        
    }
    
    
    
    //closure option
    func testFibClosure() {

        
        let positions: Int = 23
        
        let results = positions.fibClosure { (sequence: Array<Int>!) -> Int in
            
            //initialize and set formula
            let i: Int = sequence.count
            let total: Int = sequence[i - 1] + sequence[i - 2]
            
            return total
            
        }
        
        //test results
        buildResultsTest(results)
        
    }
    
    
    
    //MARK: Helper Function
    
    
    
    //helper function - test results validity
    func buildResultsTest(_ r: Array<Int>!) {

        
        if r == nil {
            XCTFail("fibonnaci test failed..")
        }
        
        //TODO: Adjust this so that it iterates through the entire sequence??
        
        if r[r.endIndex - 1] != r[r.endIndex - 2] + r[r.endIndex - 3] {
            XCTFail("fibonnaci test failed..")
        }
        
        
    }
    
 
}
