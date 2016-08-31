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
    public var key: Int
    public var index: Int
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
        let lowerbound: LLNode! = linkedList.getElement(at: 0)
        if ((lowerbound == nil) || (lowerbound.key != numberList[0])) {
            XCTFail("lowest bound retrieve fail..")
        }
        
        
        //upper bound
        let upperbound: LLNode! = linkedList.getElement(at: nodecount - 1)
        if ((upperbound == nil) || (upperbound.key != numberList[nodecount - 1])) {
          XCTFail("upper bound retrieve fail..")
        }

        
        
        //random index
        let range: UInt32 = UInt32(numberList.count)
        let randomIndex = Int(arc4random_uniform(range))
        
        

        //retrieve random index
        let randomlink: LLNode! = linkedList.getElement(at: randomIndex)
        if ((randomlink == nil) || (randomlink.key != numberList[randomIndex])) {
            XCTFail("random index retrieve fail..")
        }
        
    }
    
   
    

    //test nodes at a specific index
    func testAddLinkAtIndex() {

        
        //create list and test pair
        let linkedList: LinkedList<Int> = self.buildLinkedList()
        let testPair: keyIndex = keyIndex(key: 4, index: 3)
        
        
        linkedList.insert(testPair.key, at: testPair.index)
        linkedList.printAllKeys()
        
        
        let current = linkedList.getElement(at: testPair.index) as LLNode!
        
        
        //test condition
        if current == nil || current?.key != testPair.key {
            XCTFail("linked list addition at index failed..")
        }
        
        
        //remove test item
        linkedList.remove(at: testPair.index)
        linkedList.printAllKeys()
        
        
        //retrieve value at same position
        let removed = linkedList.getElement(at: testPair.index) as LLNode!
        
        if removed == nil || removed?.key == testPair.key {
            XCTFail("test failed: removed linked list element not found")
        }
        
        
    } //end function
    

    

    //reverse a linked list
    func testReverseLinkedList() {
        

        let linkedList: LinkedList<Int> = self.buildLinkedList()
        let linkForwards: LLNode! = linkedList.getElement(at: 0)
        
        if (linkForwards == nil) {
            XCTFail("link for reversal not found..")
        }
        
        //reverse the list
        linkedList.reverse()
        linkedList.printAllKeys()
        
        
        let linkBackwards: LLNode! = linkedList.getElement(at: 0)

        
        //evaluate keys
        if (linkForwards.key == linkBackwards.key) {
            XCTFail("reversed list failed..")
        }
        
        
    }

    

    //MARK: helper functions


    
    func buildLinkedList() ->LinkedList<Int>! {
        
        let linkedList: LinkedList<Int> = LinkedList<Int>()
        
        
        //append items
        for number in numberList {
            linkedList.append(element: number)
        }
        
        
        linkedList.printAllKeys()
        
        
        if (linkedList.count != numberList.count) {
            XCTFail("test failed: linked list count doesn't match number list..")
            return nil
        }
                
        return linkedList
        
        
    }
    
}
