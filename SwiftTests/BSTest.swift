//
//  AVLTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/23/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//
import XCTest


@testable import SwiftStructures



class BSTest: XCTestCase {
    
    
    //called before each test invocation
    override func setUp() {
        super.setUp()
    }
    
    
    
    func testCount() {
        
        let numberList = [1, 2, 3, 5, 234, -20]
        let bsTree = BSTree<Int>()
        
        for number in numberList {
            bsTree.append(element: number)
        }
        
        bsTree.root.DFSTraverse()
        
        XCTAssert(bsTree.root.count == numberList.count, "Expected tree's size to be \(numberList.count), got \(bsTree.root.count) instead.")
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

    
    
    //MARK: Search Tests

    
    
    func testContainsRoot() {
        
        let sequence: Array<Int> = [8, 2, 1, 3]
        let testvalue: Int = sequence[1]
        
        //build and balance model
        let bsTest: BSTree<Int> = buildBSTree(sequence)
        
        if bsTest.contains(testvalue) == false {
            XCTFail("contains bst test fails for value: \(testvalue)..")
        }
    }


    func testContainsLeft() {
        
        let sequence: Array<Int> = [8, 2, 1, 3]
        let testvalue: Int = sequence[2]
        
        //build and balance model
        let bsTest: BSTree<Int> = buildBSTree(sequence)
        
        if bsTest.contains(testvalue) == false {
            XCTFail("contains bst test fails for value: \(testvalue)..")
        }
    }

    
    func testContainsRight() {
        
        let sequence: Array<Int> = [8, 2, 1, 3]
        let testvalue: Int = sequence[3]
        
        //build and balance model
        let bsTest: BSTree<Int> = buildBSTree(sequence)
        
        if bsTest.contains(testvalue) == false {
            XCTFail("contains bst test fails for value: \(testvalue)..")
        }
    }


    func testContainsNoValue() {
        
        let sequence: Array<Int> = [8, 2, 1, 3]
        
        /* note - value not contained in set..*/
        let testvalue: Int = 32

        
        //build and balance model
        let bsTest: BSTree<Int> = buildBSTree(sequence)
        
        if bsTest.contains(testvalue) == true {
            XCTFail("contains bst test fails for value: \(testvalue)..")
        }
    }
    
    
    func testBFSTraversal() {
        
        let sequence: Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]
        
        //build and balance model
        let bsTest: BSTree<Int> = buildBSTree(sequence)
        
        if bsTest.root.count != sequence.count {
            XCTFail("incorrect values present for BST model..")
        }
        
        //traverse model
        bsTest.root.BFSTraverse()
        
    }


    
    //MARK: Closure Tests
    


    //update tree values with function
    func testTraverseFunction() {
        
        let bsTest = self.buildClosureTree()
        
        //invoke formula function
        bsTest.root.DFSTraverse(withFormula: traverseFormula)
        
    }
    
    
    //update bst values with closure expression
    func testTraverseExpression() {
        
        let bsTree = self.buildClosureTree()
        var didFail: Bool = false
        
        
        /*
        notes: for this test, the didFail variable is known to be 'captured' by the closure expression.
        this technique allows a single variable to be used.
        */
        
        bsTree.root.DFSTraverse { (node: BSNode<Int>) -> Int in
            
            let results = node.key! + node.height
            if node.height > 0 && node.key! == results {
                didFail = true
            }
          
            return results
        }
        
        XCTAssertFalse(didFail, "..closure update failed..")
    }

    
    
    //update avl values with closure function
    func traverseFormula(node: BSNode<Int>) -> Int {
        
        let results = node.key! + node.height
        if node.height > 0 && node.key! == results {
             XCTFail("closure update failed..")
        }
        
        return results
    }
    
    
   
    
    
    //MARK: Helper Functions
    
   
    
    //helper function - build and balance bst
    func buildBSTree(_ sequence: Array<Int>) -> () {
        
        
        //test for new instance
        let bsTest: BSTree<Int> = BSTree<Int>()
        XCTAssertNotNil(bsTest, "bst instance not created..")
        
        
        for item in sequence {
            print("adding \(item) to tree...")
            bsTest.append(element: item)
        }
        
        bsTest.root.DFSTraverse()
        
        XCTAssertTrue(bsTest.isTreeBalanced(for: bsTest.root), "tree is unbalanced..")
    }

    
    //helper function - build and balance bst
    func buildBSTree(_ sequence: Array<Int>) -> BSTree<Int> {
        
        
        //test for new instance
        let bsTest: BSTree<Int> = BSTree<Int>()
        XCTAssertNotNil(bsTest, "bst instance not created..")
        
        
        for item in sequence {
            print("adding \(item) to bst tree...")
            bsTest.append(element: item)
        }
        
        
        bsTest.root.DFSTraverse()
        
        
        XCTAssertTrue(bsTest.isTreeBalanced(for: bsTest.root), "tree is unbalanced..")

        
        return bsTest
    }
    
    

    
    //helper function - build specific model to be traversed with closures
    func buildClosureTree() -> BSTree<Int> {
        
        
        let bsTest: BSTree<Int> = BSTree<Int>()
        XCTAssertNotNil(bsTest, "bst instance not created..")
        
        
        //provide a balanced list
        let numberList : Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]
        
        
        for number in numberList {
            print("adding \(number) to avl tree...")
            bsTest.append(element: number)
        }
        
        
        XCTAssertTrue(bsTest.isTreeBalanced(for: bsTest.root), "tree is unbalanced..")
        
        
        return bsTest
    }

    
    
}
