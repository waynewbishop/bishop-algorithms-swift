//
//  AVLTreeTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/17/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

class AVLTreeTest: XCTestCase {

    var testTree: AVLTree<Int> = AVLTree<Int>()
    
    func testInstance() {
        
        XCTAssertNotNil(testTree, "instance not initialized..")
        XCTAssertNil(testTree.key, "key property not initialized..")
        XCTAssertNil(testTree.left, "left property not initialized..")
        XCTAssertNil(testTree.right, "right property not initialized..")
        
    }
  
}
