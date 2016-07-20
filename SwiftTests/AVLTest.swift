//
//  AVLTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/23/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

@testable import SwiftStructures


/* An AVL Tree is another name for a balanced binary search tree*/


class AVLTest: XCTestCase {
    
    
    //called before each test invocation
    override func setUp() {
        super.setUp()
    }
    
    
    
    func testCount() {
        
        let numberList = [1, 2, 3, 5, 234, -20]
        let tree = AVLTree<Int>()
        
        for number in numberList {
            tree.append(element: number)
        }
        
        XCTAssert(tree.count == numberList.count, "Expected tree's size to be \(numberList.count), got \(tree.count) instead.")
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
        
        let avlTest = self.buildClosureTree()
        
        //invoke formula function
        avlTest.traverse(withFormula: traverseFormula)
        
        
    }
    
    
    //update avl values with closure expression
    func testAVLTraverseExpression() {
        
        let avlTest = self.buildClosureTree()
        var didFail: Bool = false
        
        /*
        notes: for this test, the didFail variable is known to be 'captured' by the closure expression.
        this technique allows a single variable to be used.
        */
        
        avlTest.traverse { (node: AVLTree<Int>) -> Int in
            
            let results = node.key! + node.height
            if node.height > 0 && node.key! == results {
                didFail = true
            }
          
            return results
            
        }
        
        XCTAssertFalse(didFail, "..closure update failed..")
        
        
    }

    
    
    //update avl values with closure function
    func traverseFormula(node: AVLTree<Int>) -> Int {
        
        let results = node.key! + node.height
        if node.height > 0 && node.key! == results {
             XCTFail("closure update failed..")
        }

        
        return results
        
    }
    
    
   
    
    
    //MARK: Helper Functions
    
    
    //helper function - build and balance bst
    func buildAVLTree(_ numberList: Array<Int>) {
        
        
        //test for new instance
        let avlTest: AVLTree<Int> = AVLTree<Int>()
        XCTAssertNotNil(avlTest, "avl instance not created..")
        
        
        //build the tree list
        for number in numberList {
            print("adding \(number) to avl tree...")
            avlTest.append(element: number)
        }
        
        
        //traverse the completed tree
        avlTest.traverse()
        
        
        //tree balance check
        XCTAssertTrue(avlTest.isTreeBalanced(), "tree is unbalanced..")
        
        
    }
    

    
    //helper function - build specific model to be traversed with closures
    func buildClosureTree() -> AVLTree<Int> {
        
        
        //test for new instance
        let avlTest: AVLTree<Int> = AVLTree<Int>()
        XCTAssertNotNil(avlTest, "avl instance not created..")
        
        
        //provide a balanced list
        let numberList : Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]
        
        
        //build the tree list
        for number in numberList {
            print("adding \(number) to avl tree...")
            avlTest.append(element: number)
        }

        
        //tree balance check
        XCTAssertTrue(avlTest.isTreeBalanced(), "tree is unbalanced..")
        
        
        return avlTest
        
    }

    
    

}
