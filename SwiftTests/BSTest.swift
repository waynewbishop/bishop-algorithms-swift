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



class BSTest: XCTestCase {
    
    
    //called before each test invocation
    override func setUp() {
        super.setUp()
    }
    
    
    
    func testCount() {
        
        let numberList = [1, 2, 3, 5, 234, -20]
        let tree = BSTree<Int>()
        
        for number in numberList {
            tree.append(element: number)
        }
        
        XCTAssert(tree.count == numberList.count, "Expected tree's size to be \(numberList.count), got \(tree.count) instead.")
    }


    
    //essay documentation - single right rotation - O(n)
    func testEssayExample() {
        
        let numberList : Array<Int> = [29, 26, 23]
        
        //build and balance model
        let _: Void = buildBSTree(numberList)
        
    }

    
    
    //input for a balanced avl tree - O(log n)
    func testBalancedTree() {
        
        let numberList : Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]
        
        //build and balance model
        let _: Void = buildBSTree(numberList)
        
    }
    
    
    //input for multiple right rotations - O(n)
    func testRotationRight() {
        
        let numberList: Array<Int> = [29, 26, 23, 20, 19]
                
        //build and balance model
        let _: Void = buildBSTree(numberList)
        
    }
    
    
    
    //input for multiple left rotations - O(n)
    func testRotationLeft() {
        
        let numberList: Array<Int> = [19, 20, 23, 26, 29]
        
        //build and balance model
        let _: Void = buildBSTree(numberList)
        
    }
    
    
    
    //input for left and right rotations - 0(n)
    func testRotationLeftAndRight() {
        
        let numberList: Array<Int> = [19, 20, 21, 26, 16, 12]
        
        //build and balance model
        let _: Void = buildBSTree(numberList)
    }

    
    
    func testBSTrial() {
        
        let sequence: Array<Int> = [8, 2, 1]
        
        //test for new instance
        let bsTrial: BSTrial<Int> = BSTrial<Int>()
        XCTAssertNotNil(bsTrial, "bst instance not created..")
        
        
        //build the tree list
        for item in sequence {
            print("adding \(item) to tree...")
            bsTrial.append(element: item)
        }
        
        
    }
    

    /*

    //test to find element
    func testBSTContains() {
        
       let numberList : Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]
       
        //build and balance model
        let model: BSTree = buildBSTree(numberList)
    
        XCTAssertTrue(model.contains(5), "test failed: bst item not found..")
    }
    */
    
    
    
    //MARK: Closure Tests
    


    //update tree values with function
    func testTraverseFunction() {
        
        let avlTest = self.buildClosureTree()
        
        //invoke formula function
        avlTest.traverse(withFormula: traverseFormula)
        
        
    }
    
    
    //update avl values with closure expression
    func testTraverseExpression() {
        
        let avlTest = self.buildClosureTree()
        var didFail: Bool = false
        
        /*
        notes: for this test, the didFail variable is known to be 'captured' by the closure expression.
        this technique allows a single variable to be used.
        */
        
        avlTest.traverse { (node: BSTree<Int>) -> Int in
            
            let results = node.key! + node.height
            if node.height > 0 && node.key! == results {
                didFail = true
            }
          
            return results
            
        }
        
        XCTAssertFalse(didFail, "..closure update failed..")
        
        
    }

    
    
    //update avl values with closure function
    func traverseFormula(node: BSTree<Int>) -> Int {
        
        let results = node.key! + node.height
        if node.height > 0 && node.key! == results {
             XCTFail("closure update failed..")
        }

        
        return results
        
    }
    
    
   
    
    
    //MARK: Helper Functions
    
   
    
    //helper function - build and balance bst
    func buildBSTree<T: Comparable>(_ sequence: Array<T>) -> Void {
        
        
        //test for new instance
        let bsTest: BSTree<T> = BSTree<T>()
        XCTAssertNotNil(bsTest, "bst instance not created..")
        
        
        //build the tree list
        for item in sequence {
            print("adding \(item) to tree...")
            bsTest.append(element: item)
        }
        
        
        //traverse the completed tree
        bsTest.traverse()
        
        
        //tree balance check
        XCTAssertTrue(bsTest.isTreeBalanced(), "tree is unbalanced..")
        
    }

    
    //helper function - build and balance bst
    func buildBSTree<T: Comparable>(_ sequence: Array<T>) -> BSTree<T> {
        
        
        //test for new instance
        let bsTest: BSTree<T> = BSTree<T>()
        XCTAssertNotNil(bsTest, "bst instance not created..")
        
        
        //build the tree list
        for item in sequence {
            print("adding \(item) to bst tree...")
            bsTest.append(element: item)
        }
        
        
        //traverse the completed tree
        bsTest.traverse()
        
        
        //tree balance check
        XCTAssertTrue(bsTest.isTreeBalanced(), "tree is unbalanced..")

        
        return bsTest
    }
    
    

    
    //helper function - build specific model to be traversed with closures
    func buildClosureTree() -> BSTree<Int> {
        
        
        //test for new instance
        let bsTest: BSTree<Int> = BSTree<Int>()
        XCTAssertNotNil(bsTest, "avl instance not created..")
        
        
        //provide a balanced list
        let numberList : Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]
        
        
        //build the tree list
        for number in numberList {
            print("adding \(number) to avl tree...")
            bsTest.append(element: number)
        }

        
        //tree balance check
        XCTAssertTrue(bsTest.isTreeBalanced(), "tree is unbalanced..")
        
        
        return bsTest
        
    }

    
    

}
