//
//  LLNodeTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/16/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

class LLNodeTest: XCTestCase {

    
    //test for nill values
    func testInitalization() {
        
        var testNode: LLNode<Int>! = LLNode<Int>()
        
        XCTAssertNotNil(testNode, "...instance not initialized.")
        XCTAssertNil(testNode.key, "..key not initialized.")
        
        if let nextNode = testNode.next {
            XCTFail("..left node value not initialized")
        }
        
        
    }
    
    
} //end testcase
