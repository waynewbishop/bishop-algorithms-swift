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
