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
    }
    
    
    
    
    func testAddWord() {
        filter.addWord("Testing")
    }
    
 
}
