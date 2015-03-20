//
//  AVLTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/23/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

/* An AVL Tree is another name for a balanced binary search tree*/


class AVLTest: XCTestCase {
 
    
    var avlTest: AVLTree<Int> = AVLTree<Int>()
    let numberList : Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]
    
    
    //called before each test invocation
    override func setUp() {
        super.setUp()
        
        //test for new instance
         XCTAssertNotNil(avlTest, "avl instance not created..")
        
        
        //build the tree list
        for number in numberList {
            println("adding \(number) to avl tree...")
            avlTest.addNode(number)
        }
        

    }
    
    
    //TODO: Determine how I can change this so that I can run checks for balanced and unbalanced trees..
    
    
    //invoke in-order travesal algorithm
    func testAVLDepthTraversal() {
        
        //check on this in the output
        avlTest.processAVLDepthTraversal()
        
    } //end function
    
}
