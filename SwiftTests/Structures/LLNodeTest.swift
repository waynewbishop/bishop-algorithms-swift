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

    var testNode: LLNode<Int> = LLNode<Int>()
    
    //test a node instance
    func testInit() {
        
        XCTAssertNotNil(testNode, "instance not initialized..")
        XCTAssertNil(testNode.key, "key not initialized..")
        XCTAssertNil(testNode.next, "next node propety not initialized..")
        XCTAssertNil(testNode.previous, "previous node propety not initialized..")
    
    }
    
    
} //end testcase
