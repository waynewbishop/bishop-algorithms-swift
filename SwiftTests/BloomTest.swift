//
//  BloomTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/3/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class BloomTest: XCTestCase {
    
    var listsize: Int!
    var filter: Bloom!

    
    override func setUp() {
        super.setUp()
        
        //set the initial size and capacity
        listsize = 50
        filter = Bloom(capacity: listsize)

        
        //add word list
        filter.addWord("Seal")
        filter.addWord("Sour")
        filter.addWord("Seattle") // -- overlap with "Sour" index at 2nd position
        filter.addWord("Seat")
        filter.addWord("Sat")
        filter.addWord("Sell")
        
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

    
    
}
