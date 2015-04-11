//
//  LinkedTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/23/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest



//basic struct for grouping values
struct keyIndex {
    private var key: Int
    private var index: Int
}



class LinkedTest: XCTestCase {

    
    //establish the test numbers
    var numberList : Array<Int>!
    
    
    override func setUp() {
        super.setUp()
        numberList = [8, 2, 10, 9, 7, 5]
    }
    
    
    //retrieve specific links
    func testLinkAtIndex() {
        
        //create a new instance
        var linkedList: LinkedList<Int> = self.buildLinkedList()
        
        //TODO: Work on building upper, lower and non-existent test bounds
        
        
    }

    

    //test nodes at a specific index
    func testAddLinkAtIndex() {

        
        //create a new instance
        var linkedList: LinkedList<Int> = self.buildLinkedList()
        var testPair: keyIndex = keyIndex(key: 4, index: 3)
        
        
        //insert at a specific index
        linkedList.addLinkAtIndex(testPair.key, index: testPair.index)
        linkedList.printAllKeys()

        

        //retrieve the selected value
        var current = linkedList.linkAtIndex(testPair.index) as LLNode!
        
        
        if ((current == nil) || (current.key != testPair.key)) {
            XCTFail("linked list addition at index failed..")
        }

        
        //remove at a specific index
        linkedList.removeLinkAtIndex(testPair.index)
        linkedList.printAllKeys()

        
        //retrieve value at position
        var removed = linkedList.linkAtIndex(testPair.index) as LLNode!
        
        if (removed.key == testPair.key) {
            XCTFail("linked list removal failed..")
        }
        
        
        
    } //end function
    

    

    //reverse a linked list
    func testReverseLinkedList() {
        
        
        var forwardList: LinkedList<Int> = LinkedList<Int>()
        var reverseList: LinkedList<Int> = LinkedList<Int>()
        
        
        //append list items
        for number in numberList {
            forwardList.addLink(number)
        }

        
    }

    

    //MARK: helper function
    

    //helper method to build list
    func buildLinkedList() ->LinkedList<Int>! {
        
        
        //create a new instance
        var linkedList: LinkedList<Int> = LinkedList<Int>()
        
        
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
