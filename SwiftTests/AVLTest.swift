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


    
    //essay documentation - single right rotation - O(n)
    func testAVLEssayExample() {
        
        let numberList : Array<Int> = [29, 26, 23]
        
        //build and balance model
        self.buildAVLTree(numberList)
        
    }

    
    
    //input for a balanced avl tree - O(log n)
    func testAVLBalancedTree() {
        
        let numberList : Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]
        
        //build and balance model
        self.buildAVLTree(numberList)
        
    }
    
    
    //input for multiple right rotations - O(n)
    func testAVLRotationRight() {
        
        let numberList: Array<Int> = [29, 26, 23, 20, 19]
                
        //build and balance model
        self.buildAVLTree(numberList)
    }
    
    
    
    //input for multiple left rotations - O(n)
    func testAVLRotationLeft() {
        
        let numberList: Array<Int> = [19, 20, 23, 26, 29]
        
        //build and balance model
        self.buildAVLTree(numberList)
        
    }
    
    
    
    //input for left and right rotations - 0(n)
    func testAVLRotationLeftAndRight() {
        
        let numberList: Array<Int> = [19, 20, 21, 26, 16, 12]
        
        //build and balance model
        self.buildAVLTree(numberList)
        
    }

    
    
    //MARK: Helper Function
    
    
    //helper function - build and balance bst
    func buildAVLTree(numberList: Array<Int>) {
        
        
        //test for new instance
        var avlTest: AVLTree<Int> = AVLTree<Int>()
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

    


}
