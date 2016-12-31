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



class LinkedTest: XCTestCase {
    
    let numberList = [8, 2, 10, 9, 7, 5]
    
    
    override func setUp() {
        super.setUp()
    }
    
    
    //retrieve specific links
    func testLinkAtIndex() {
        
        
        let linkedList = buildLinkedList()
        let nodeCount = linkedList.count

        
        //lowest bound
        guard let lowerbound = linkedList.getElement(at: 0), lowerbound.key == numberList[0] else {
            XCTFail("lowest bound retrieve fail..")
            return
        }
        
        
        //upper bound
        guard let upperbound = linkedList.getElement(at: nodeCount - 1), upperbound.key == numberList[nodeCount - 1] else {
          XCTFail("upper bound retrieve fail..")
            return
        }

        
        
        //random index
        let range = UInt32(numberList.count)
        let randomIndex = Int(arc4random_uniform(range))
        


        //retrieve random index
        guard let randomLink = linkedList.getElement(at: randomIndex), randomLink.key == numberList[randomIndex] else {
            XCTFail("random index retrieve fail..")
            return
        }
        
    }
    
   
    

    //test nodes at a specific index
    func testAddLinkAtIndex() {

        
        //create list and test pair
        let linkedList = buildLinkedList()
        let testPair = (key: 4, index: 3)
        
        
        linkedList.insert(testPair.key, at: testPair.index)
        linkedList.printAllKeys()
        
        
        guard let current = linkedList.getElement(at: testPair.index), current.key == testPair.key else {
            XCTFail("linked list addition at index failed..")
            return
        }
        
        
        //remove test item
        linkedList.remove(at: testPair.index)
        linkedList.printAllKeys()
        
        
        //retrieve value at same position
        guard let removed = linkedList.getElement(at: testPair.index), removed.key == testPair.key else {
            XCTFail("test failed: removed linked list element not found")
            return
        }
        
        
    } //end function
    

    

    //reverse a linked list
    func testReverseLinkedList() {
        

        let linkedList = buildLinkedList()
        guard let linkForwards = linkedList.getElement(at: 0) else {
            XCTFail("link for reversal not found..")
            return
        }
        
        //reverse the list
        linkedList.reverse()
        linkedList.printAllKeys()
        
        
        guard let linkBackwards = linkedList.getElement(at: 0), linkForwards.key != linkBackwards.key else {
            XCTFail("reversed list failed..")
            return
        }
        
        
    }

    

    //MARK: helper functions

    func buildLinkedList() -> LinkedList<Int> {
        
        let linkedList = LinkedList<Int>()
        
        
        //append items
        for number in numberList {
            linkedList.append(element: number)
        }
        
        
        linkedList.printAllKeys()
        
        
        XCTAssert(linkedList.count == numberList.count, "test failed: linked list count \(linkedList.count) doesn't match number list count \(numberList.count).")
        
        return linkedList
        
    }
    
}
