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

    
    //test a node instance
    func testInit() {
        
        var testNode: LLNode<Int> = LLNode<Int>()
        
        XCTAssertNotNil(testNode, "instance not initialized..")
        XCTAssertNil(testNode.key, "key not initialized..")
        
        if let nodeNext = testNode.next {
            XCTFail("next node propety not initialized..")
        }
        
        if let nodePrevious = testNode.previous {
            XCTFail("previous node property not initialized..")
        }
        
    }
    
    
} //end testcase
