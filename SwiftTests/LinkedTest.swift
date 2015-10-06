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

    var numberList : Array<Int> = [8, 2, 10, 9, 7, 5]
    
    //retrieve specific links
    func testLinkAtIndex() {
        
        
        let linkedList: LinkedList<Int> = [8, 2, 10, 9, 7, 5]
        let nodecount: Int = linkedList.count

        
        //lowest bound
        let lowerbound: LLNode! = try! linkedList.linkAtIndex(0)
        if ((lowerbound == nil) || (lowerbound.key != numberList[0])) {
            XCTFail("lowest bound retrieve fail..")
        }
        
        
        //upper bound
        let upperbound: LLNode! = try! linkedList.linkAtIndex(nodecount - 1)
        if ((upperbound == nil) || (upperbound.key != numberList[nodecount - 1])) {
          XCTFail("upper bound retrieve fail..")
        }

        
        
        //random index
        let range: UInt32 = UInt32(numberList.count)
        let randomIndex = Int(arc4random_uniform(range))
        
        

        //retrieve random index
        let randomlink: LLNode! = try! linkedList.linkAtIndex(randomIndex)
        if ((randomlink == nil) || (randomlink.key != numberList[randomIndex])) {
            XCTFail("random index retrieve fail..")
        }
        
        
    }
    
   

    

    //test nodes at a specific index
    func testAddLinkAtIndex() {

        
        //create list and test pair
        let linkedList: LinkedList<Int> = [8, 2, 10, 9, 7, 5]
        let testPair: keyIndex = keyIndex(key: 4, index: 3)
        
        
        try! linkedList.addLinkAtIndex(testPair.key, index: testPair.index)
        linkedList.printAllKeys()
        

        //retrieve the selected value
        let current = try! linkedList.linkAtIndex(testPair.index) as LLNode!

        
        if ((current == nil) || (current.key != testPair.key)) {
            XCTFail("linked list addition at index failed..")
        }

        
        
        try! linkedList.removeLinkAtIndex(testPair.index)
        linkedList.printAllKeys()

        
        
        //retrieve new value at same position
        let removed = try! linkedList.linkAtIndex(testPair.index) as LLNode!
        if (removed.key == testPair.key) {
            XCTFail("linked list removal failed..")
        }
        
        
    } //end function
    

    

    //reverse a linked list
    func testReverseLinkedList() {
        

        let linkedList: LinkedList<Int> = [8, 2, 10, 9, 7, 5]
        let linkForwards: LLNode! = try! linkedList.linkAtIndex(0)
        
        if (linkForwards == nil) {
            XCTFail("link for reversal not found..")
        }
        
        //reverse the list
        linkedList.reverseLinkedList()
        linkedList.printAllKeys()
        
        
        let linkBackwards: LLNode! = try! linkedList.linkAtIndex(0)

        
        //evaluate keys
        if (linkForwards.key == linkBackwards.key) {
            XCTFail("reversed list failed..")
        }
        
        
    }

	//ArrayLiteralConvertible, SequenceType and related init test
	func testLinkedListArrayLiteralConvertible() {
		
		let linkedList1: LinkedList<Int> = [8, 2, 10, 9, 7, 5]
		
		//create a new instance
		let linkedList2: LinkedList<Int> = LinkedList<Int>()
		
		
		//append list items
		for number in numberList.reverse() {
			linkedList2.addLink(number)
		}
		
		//print all the keys
		linkedList2.printAllKeys()
		
		if (linkedList2.count != numberList.count) {
			XCTFail("linked list count doesn't match number list..")
			return
		}
		
		let linkedList3: LinkedList<Int> = LinkedList<Int>(values: self.numberList)
		
		if (linkedList1.count != linkedList2.count || linkedList2.count != linkedList3.count) {
			XCTFail("list not initialized..")
		}
		
		let generator1 = linkedList1.generate()
		let generator2 = linkedList2.generate()
		let generator3 = linkedList3.generate()
		
		var current1 = generator1.next()
		var current2 = generator2.next()
		var current3 = generator3.next()
		
		while (current1 != nil || current2 != nil || current3 != nil) {
			if (current1?.key != current2?.key || current2?.key != current3?.key)
			{
				XCTFail("initialization is not match")
				break
			}
			current1 = generator1.next()
			current2 = generator2.next()
			current3 = generator3.next()
		}
		if (current1 != nil || current2 != nil || current3 != nil)
		{
			XCTFail("initialization is not match")
		}
	}
	
	// linked list internal structure
	func testLinkedListStructure() {
		
		
		let linkedList: LinkedList<Int> = [8, 2, 10, 9, 7, 5]
		
		if (linkedList.count != 6) {
			XCTFail("list not initialized..")
		}
		
		var index = 0
		for current in linkedList {
			if (index == 0 && (current.previous != nil || current.next == nil || !(current.next?.previous === current)))
			{
				XCTFail("LLNode is not corrent")
				break
			}
			if (index > 0 && index < linkedList.count - 1 && (!(current.previous?.next === current) || !(current.next?.previous === current)))
			{
				XCTFail("LLNode is not corrent")
				break
			}
			if (index == linkedList.count - 1 && (current.previous == nil || current.next != nil || !(current.previous?.next === current)))
			{
				XCTFail("LLNode is not corrent")
				break
			}
			
			index++
		}
	}
}
