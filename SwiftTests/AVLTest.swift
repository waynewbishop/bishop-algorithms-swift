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

    

    
    //MARK: Closure Tests
    


    //update tree values with function
    func testAVLTraverseFunction() {
        
        var avlTest = self.buildClosureTree()
        
        //invoke formula function
        avlTest.traverse(traverseFormula)
        
    }
    
    
    //update tree values with closure expression
    func testAVLTraverseExpression() {
        
        var avlTest = self.buildClosureTree()
        
        
        avlTest.traverse { (node: AVLTree<Int>) -> Int in
            
            var testVal = node.key!
            var results = node.key! + node.height
            
            if node.height > 0 && results == testVal {  //very simple test
                XCTFail("closure update failed..")
            }
            else {
               println("the updated key is: \(results). node height is: \(node.height)")
            }
            
            return results
            
        } //end closure
        
        
    }

    
    
    //example function - can only be calcuated through a traversal
    func traverseFormula(node: AVLTree<Int>) -> Int {
        
        var testVal = node.key!
        var results = node.key! + node.height
        
        if node.height > 0 && results == testVal {  //very simple test
            XCTFail("closure update failed..")
        }
        else {
            println("the updated key is: \(results). node height is: \(node.height)")
        }
        
        return results
        
    }
    
    
   
    
    
    //MARK: Helper Functions
    
    
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
        avlTest.traverse()
        
        
        //tree balance check
        XCTAssertTrue(avlTest.isTreeBalanced(), "tree is unbalanced..")
        
        
    }
    

    
    //helper function - build specific model to be traversed with closures
    func buildClosureTree() -> AVLTree<Int> {
        
        
        //test for new instance
        var avlTest: AVLTree<Int> = AVLTree<Int>()
        XCTAssertNotNil(avlTest, "avl instance not created..")
        
        
        //provide a balanced list
        let numberList : Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]
        
        
        //build the tree list
        for number in numberList {
            println("adding \(number) to avl tree...")
            avlTest.addNode(number)
        }

        
        //tree balance check
        XCTAssertTrue(avlTest.isTreeBalanced(), "tree is unbalanced..")
        
        
        return avlTest
        
    }

    
    

}
