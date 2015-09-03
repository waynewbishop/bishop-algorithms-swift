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
    var filter: Bloom<String>!

    
    override func setUp() {
        super.setUp()
        
        //set the initial size and capacity
        listsize = 25
        filter = Bloom<String>(capacity: listsize)
      
    }
    
    

    func testAddWord() {
       
        filter.add("Wayne")
        
    }
    
 
}
