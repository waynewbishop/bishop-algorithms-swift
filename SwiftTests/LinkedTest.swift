//
//  LinkedTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/23/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

@testable import SwiftStructures


//struct for testing indicies
struct keyIndex {
    private var key: Int
    private var index: Int
}



class LinkedTest: XCTestCase {

    
    var numberList : Array<Int>!
    
    
    override func setUp() {
        super.setUp()
        numberList = [8, 2, 10, 9, 7, 5]
    }
    
    
    //retrieve specific links
    func testLinkAtIndex() {
        
        
        let linkedList: LinkedList<Int> = self.buildLinkedList()
        let nodecount: Int = linkedList.count

        
        //lowest bound
        let lowerbound: LLNode! = linkedList.linkAtIndex(0)
        if ((lowerbound == nil) || (lowerbound.key != numberList[0])) {
            XCTFail("lowest bound retrieve fail..")
        }
        
        
        //upper bound
        let upperbound: LLNode! = linkedList.linkAtIndex(nodecount - 1)
        if ((upperbound == nil) || (upperbound.key != numberList[nodecount - 1])) {
          XCTFail("upper bound retrieve fail..")
        }

        
        
        //random index
        let range: UInt32 = UInt32(numberList.count)
        let randomIndex = Int(arc4random_uniform(range))
        
        

        //retrieve random index
        let randomlink: LLNode! = linkedList.linkAtIndex(randomIndex)
        if ((randomlink == nil) || (randomlink.key != numberList[randomIndex])) {
            XCTFail("random index retrieve fail..")
        }
        
        
    }
    
   

    

    //test nodes at a specific index
    func testAddLinkAtIndex() {

        
        //create list and test pair
        let linkedList: LinkedList<Int> = self.buildLinkedList()
        let testPair: keyIndex = keyIndex(key: 4, index: 3)
        
        
        linkedList.addLinkAtIndex(testPair.key, index: testPair.index)
        linkedList.printAllKeys()
        

        //retrieve the selected value
        let current = linkedList.linkAtIndex(testPair.index) as LLNode!

        
        if ((current == nil) || (current.key != testPair.key)) {
            XCTFail("linked list addition at index failed..")
        }

        
        
        linkedList.removeLinkAtIndex(testPair.index)
        linkedList.printAllKeys()

        
        
        //retrieve new value at same position
        let removed = linkedList.linkAtIndex(testPair.index) as LLNode!
        if (removed.key == testPair.key) {
            XCTFail("linked list removal failed..")
        }
        
        
    } //end function
    

    

    //reverse a linked list
    func testReverseLinkedList() {
        

        let linkedList: LinkedList<Int> = self.buildLinkedList()
        let linkForwards: LLNode! = linkedList.linkAtIndex(0)
        
        if (linkForwards == nil) {
            XCTFail("link for reversal not found..")
        }
        
        //reverse the list
        linkedList.reverseLinkedList()
        linkedList.printAllKeys()
        
        
        let linkBackwards: LLNode! = linkedList.linkAtIndex(0)

        
        //evaluate keys
        if (linkForwards.key == linkBackwards.key) {
            XCTFail("reversed list failed..")
        }
        
        
    }
    
    func testEmptyLinkedList() {
        
        let linkedList = LinkedList<Int>()
        XCTAssert(linkedList.count == 0 , "Linked list count should have been 0, but was \(linkedList.count) instead")
        
        linkedList.addLink(0)
        linkedList.removeLinkAtIndex(0)
        
        XCTAssert(linkedList.count == 0 , "Linked list count should have been 0, but was \(linkedList.count) instead")
    }

    func testRemoveFirstIndex() {
        
        let linkedList = self.buildLinkedList()
        let index = 0
        
        linkedList.removeLinkAtIndex(index)
        let value = linkedList.linkAtIndex(index).key
        let expectedValue = 2
        
        XCTAssert(value == expectedValue, "Linked list value should have been \(expectedValue), but was \(value) instead")
        XCTAssert(linkedList.count == 5, "Linked list count should have been 5, but was \(linkedList.count) instead")
    }
    
    func testRemoveAtIndex() {
        
        let linkedList = self.buildLinkedList()
        let index = 2
        
        linkedList.removeLinkAtIndex(index)
        let value = linkedList.linkAtIndex(index).key
        let expectedValue = 9
        
        XCTAssert(value == expectedValue, "Linked list value should have been \(expectedValue), but was \(value) instead")
        XCTAssert(linkedList.count == 5, "Linked list count should have been 5, but was \(linkedList.count) instead")
    }

    func testRemoveLastIndex() {
        
        let linkedList = self.buildLinkedList()
        var index = 5
        
        linkedList.removeLinkAtIndex(index)
        index -= 1
        let value = linkedList.linkAtIndex(index).key
        let expectedValue = 7
        
        XCTAssert(value == expectedValue, "Linked list value should have been \(expectedValue), but was \(value) instead")
        XCTAssert(linkedList.count == 5, "Linked list count should have been 5, but was \(linkedList.count) instead")
    }
    

    //MARK: helper functions

    
    
    //helper method to build list
    func buildLinkedList() ->LinkedList<Int>! {
        
        
        //create a new instance
        let linkedList: LinkedList<Int> = LinkedList<Int>()
        
        
        //append list items
        for number in numberList {
            linkedList.addLink(number)
        }
        
        //print all the keys
        linkedList.printAllKeys()
        
        
        if (linkedList.count != numberList.count) {
            XCTFail("linked list count doesn't match number list..")
            return nil
        }
        
        return linkedList
        
        
    }
    
}
