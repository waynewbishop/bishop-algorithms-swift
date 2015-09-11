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
        listsize = 25
        filter = Bloom(capacity: listsize)


        //TODO: build an array of words that pass (no overlap)
        //TODO: build an array of words that pass (overlap)
        //TODO: build an array of words that fail (no overlap)
        
        //Need to just build a list of words to determine what overlaps - check indicies..
        
        //add the a test word to the set
        filter.addWord("Testing") //TODO: change to help method(s)
        
    }
    
    
    
    
    func testContains() {
        
        if filter.contains("Testing".replace(" ", replacement: "")) == true {
            print("word contained in set...")
        }
            
        else {
            XCTFail("word not found..")
        }
        
    }

    
    
}
