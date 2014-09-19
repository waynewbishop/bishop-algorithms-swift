//
//  FactoriesTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/17/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

class FactoriesTest: XCTestCase {
    
    let numberList : Array<Int> = [8, 2, 10, 9, 7, 5]
    
    
    func testLinkedList() {
        
        //create a new instance
        var linkedList: LinkedList<Int> = LinkedList<Int>()
        
        
        //append list items
        for number in numberList {
            linkedList.addLink(number)
        }
        
        //print all the keys
        linkedList.printAllKeys();
        
        
        if (linkedList.count != numberList.count) {
            XCTFail("linked list count doesn't match number list..")
        }
        
        
        //insert a node at a specific index
        linkedList.addLinkAtIndex(4, index: 3)
        linkedList.printAllKeys()
        
        if (linkedList.count != numberList.count + 1) {
            XCTFail("linked list addition at index failed..")
        }
        
        
        linkedList.removeLinkAtIndex(1)
        linkedList.printAllKeys()

        if (linkedList.count != numberList.count) {
            XCTFail("linked list count doesn't match number list..")
        }
        
        
        
    } //end function

    
    func testInsertionSort() {
        
        var sortTest: Sorting = Sorting()
        XCTAssertNotNil(sortTest, "sorting instance not created..")
        
        
        //pass the list to be sorted
        var resultList: Array<Int>! = sortTest.insertionSort(numberList)
        
        
        //determine if the numbers are sorted
        var x: Int = 0
        for (x = 0; x < resultList.count; x++) {
            
            if ((x > 0) && (resultList[x] < resultList[x - 1])) {
                XCTFail("numberlist items not in sorted order..")
            }
            else {
                println("item \(resultList[x]) is sorted..")
            }
            
            
        } //end for
        
        
        
    } //end function
    
    
    
    func testBubbleSort() {
        
        
        var sortTest: Sorting = Sorting()
        XCTAssertNotNil(sortTest, "sorting instance not created..")
        
        
        //pass the list to be sorted
        var resultList: Array<Int>! = sortTest.bubbleSort(numberList)
        
        
        //determine if the numbers are sorted
        var x: Int = 0
        for (x = 0; x < resultList.count; x++) {
            
            if ((x > 0) && (resultList[x] < resultList[x - 1])) {
                XCTFail("numberlist items not in sorted order..")
            }
            else {
                println("item \(resultList[x]) is sorted..")
            }
            
            
        } //end for
        
        
        
    } //end function

    
    
    //invoke in-order travesal algorithm
    func testAVLDepthTraversal() {
        
        //create a new instance
        var avlTest: AVLTree<Int> = AVLTree<Int>()
        XCTAssertNotNil(avlTest, "avl instance not created..")
        
        
        //build the list
        for number in numberList {
                avlTest.addNode(number)
        }

        //check on this in the output
        avlTest.processAVLDepthTraversal()
        
        
    } //end function
    
    
}


