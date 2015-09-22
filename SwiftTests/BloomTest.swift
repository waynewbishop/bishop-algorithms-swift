//
//  BloomTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/3/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


struct Pairset {
    var first: Int = 0
    var second: Int = 0
}



class BloomTest: XCTestCase {
    
    var listsize: Int!
    var filter: Bloom<String>!

    
    override func setUp() {
        super.setUp()
        
        //set the initial size and capacity
        listsize = 50
        filter = Bloom(capacity: listsize)

        /*
        
        //add word list
        filter.addWord("Seal")
        filter.addWord("Sour")
        filter.addWord("Seattle") // -- overlap with "Sour" index at 2nd position
        filter.addWord("Seat")
        filter.addWord("Sat")
        filter.addWord("Sell")
        
        */
    }
    

    //test words inclded in filter set
    func testContainsPass() {
        
        XCTAssertTrue(filter.contains("Seal"), "word not contained in set..")
        XCTAssertTrue(filter.contains("Sour"), "word not contained in set..")
        XCTAssertTrue(filter.contains("Seattle"), "word not contained in set..")
    }
    
    
    //test words not included in filter set
    func testContainsFail() {
        
        XCTAssertFalse(filter.contains("Sea"), "word contained in set..")
        XCTAssertFalse(filter.contains("Sunk"), "word contained in set..")
        XCTAssertFalse(filter.contains("Sick"), "word contained in set..")
    }

    
    /*
    Notes: find all unique pairs of (a, b) whose sum is equal to T.
    Process occurs in linear time O(n).
    */
    
    
    func testFindPairOfSum() {
        
        
        let valueList: Array<Int> = [5, 3, 7, 0, 1, 4, 2]
        var uniqueList = Array<Int>()
        let sum: Int = 5
        
        var finalList = Array<Pairset>()
        
        
        for s in 0...valueList.count - 1 {
            
            print("s is: \(s)")
            
            
            //calculate result
            let results = sum - valueList[s]
            
            
            //check for membership - TODO: Change to bloom filter
            
            if valueList.contains(results) {
                
                
                var valpair: Pairset! = Pairset()
                
                
                //create paired assignment
                valpair.first = valueList[s]
                valpair.second = results
                
                
                
                //check first pair value
                if !uniqueList.contains(valpair.first) {
                    uniqueList.append(valpair.first)
                }
                
                
                //check second pair value
                if !uniqueList.contains(valpair.second) {
                    uniqueList.append(valpair.second)
                    
                    
                    //add the unique pair to the final liost
                    finalList.append(valpair)
                    
                } //end if
                                
                
            } //end if
            
            
        } //end for
        
        print("end test..")
        
    } //end function
    

    
    
    
}
