//
//  LinkedTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/23/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

class LinkedTest: XCTestCase {

    
    //establish the test numbers
    var numberList : Array<Int>!
    
    
    override func setUp() {
        super.setUp()
        numberList = [8, 2, 10, 9, 7, 5]
    }

    
    
    
    func testAddLink() {
        
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
        }
        
    }

    
    func testLinkedList() {
        
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
    

    

    //reverse a linked list
    func testReverseLinkedList() {
        
        
        var forwardList: LinkedList<Int> = LinkedList<Int>()
        var reverseList: LinkedList<Int> = LinkedList<Int>()
        
        
        //append list items
        for number in numberList {
            forwardList.addLink(number)
        }

        
        //TODO: test other bound scenarios for new method..
        
        var outOfBounds: LLNode! = forwardList.linkAtIndex(6)
        
        
    }
    
    
}
