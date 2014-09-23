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

    
    let numberList : Array<Int> = [8, 2, 10, 9, 7, 5]
    
    
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

    
}
