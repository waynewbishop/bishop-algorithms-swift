//
//  BloomTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/3/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures



//simple structure to group value pairs
struct Pairset {
    
    var first: Int
    var second: Int
    
    init() {
        self.first = 0
        self.second = 0
    }
    
}




class BloomTest: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        
        }
    

    
    
    //test filter for contained strings
    func testContainsString() {
        
        
        /*
        notes: the inclusion of "Seattle" overlap with "Sour"
        at the second position index
        */
        
        let filter: Bloom<String>! = Bloom(items: ["Seal", "Sour", "Seattle", "Seat", "Sat", "Sell"])
        
        
        //test included words
        XCTAssertTrue(filter.contains("Seal"), "word not in set..")
        XCTAssertTrue(filter.contains("Sour"), "word not in set..")
        XCTAssertTrue(filter.contains("Seattle"), "word not in set..")
        
        
        //test excluded words
        XCTAssertFalse(filter.contains("Sea"), "word included in set..")
        XCTAssertFalse(filter.contains("Sunk"), "word included in set..")
        XCTAssertFalse(filter.contains("Sick"), "word included in set..")
        
        
    }

    
    
    
    //conduct pair-sum test with 5
    func testPairSumFive() {
     
        let valueList: Array<Int> = [5, 3, 7, 0, 1, 4, 2]
        let sumtotal: Int = 5
        
        
        let sumList: Array<Pairset> = self.printPairs(valueList, sum: sumtotal)
        
        
        //conduct final test
        for s in sumList {
            
            if s.first + s.second != sumtotal {
                XCTFail("test failed")
            }
            else {
                print("pair: (\(s.first),\(s.second))")
            }
            
        }
        
        
    }
    
    
    
    //conduct pair-sum test with 10
    func testPairSumTen() {
        
        let valueList: Array<Int> = [8, 3, 7, 0, 1, 4, 2, 6, 5]
        let sumtotal: Int = 10
        
        
        let sumList: Array<Pairset> = self.printPairs(valueList, sum: sumtotal)
        
        
        //conduct final test
        for s in sumList {
            if s.first + s.second != sumtotal {
                XCTFail("test failed")
            }
            else {
               print("pair: (\(s.first),\(s.second))")
            }
            
        }
        
        
    }

    

    
    //MARK: //helper functions
    

    
    //calculate unique pairs - O(n)
    func printPairs(valueList: Array<Int>, sum: Int) -> Array<Pairset>! {
                
        var sumList: Array<Pairset> = Array<Pairset>()
        let filter: Bloom<Int> = Bloom()

        
        for s in 0...valueList.count - 1 {
            

            print("s is: \(s)")
            
            
            //calculate result
            let results = sum - valueList[s]
            
            
            if valueList.contains(results) {
                var valpair: Pairset! = Pairset()
                
                
                //assign pair
                valpair.first = valueList[s]
                valpair.second = results
                
                
                //test for bloom membership
                if !filter.contains(valpair.first) {
                    filter.addElement(valpair.first)
                }
                
                
                if !filter.contains(valpair.second) {
                    filter.addElement(valpair.second)
                    
                    //add the unique pair to the final list
                    sumList.append(valpair)
                }
            }
        }

        
        return sumList

        
    } //end function

    
    
}
