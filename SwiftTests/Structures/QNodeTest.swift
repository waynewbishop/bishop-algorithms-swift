//
//  QNodeTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/16/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

class QNodeTest: XCTestCase {
    
    var testNode: QNode<Int> = QNode<Int>()
    
    //test a node instance
    func testInstance() {
        
        XCTAssertNotNil(testNode, "instance not initialized..")
        XCTAssertNil(testNode.key, "key not initialized..")
        XCTAssertNil(testNode.next, "next instance not initialized..")
    }


}
