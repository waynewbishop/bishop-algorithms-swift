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
    
    
    //called before each test invocation
    override func setUp() {
        super.setUp()
    }

    
    
    //build a model for a balanced avl tree - O(log n)
    func testAVLBalancedTree() {
        
        
        //test for new instance
        var avlTest: AVLTree<Int> = AVLTree<Int>()
        XCTAssertNotNil(avlTest, "avl instance not created..")
        
        
        let numberList : Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]
        

        //test for new instance
        XCTAssertNotNil(avlTest, "avl instance not created..")
        
        
        //build the tree list
        for number in numberList {
            println("adding \(number) to avl tree...")
            avlTest.addNode(number)
        }


        //traverse the completed tree
        avlTest.processAVLDepthTraversal()
        
        
        //tree balance check
        XCTAssertTrue(avlTest.isTreeBalanced(), "tree is unbalanced..")

        
    }
    
    
    //build a model for an unbalanced tree - O(n)
    func testAVLUnbalancedTree() {
        
        
        //test for new instance
        var avlTest: AVLTree<Int> = AVLTree<Int>()
        XCTAssertNotNil(avlTest, "avl instance not created..")

        
        let numberList : Array<Int> = [8, 7, 6, 5, 4, 3, 2, 1]
        
        
        //test for new instance
        XCTAssertNotNil(avlTest, "avl instance not created..")
        
        
        //build the tree list
        for number in numberList {
            println("adding \(number) to avl tree...")
            avlTest.addNode(number)
        }
        
        
        //traverse the completed tree
        avlTest.processAVLDepthTraversal()
        
        
        //tree balance check
        XCTAssertFalse(avlTest.isTreeBalanced(), "tree is balanced..")

        
    }
    
    


}
