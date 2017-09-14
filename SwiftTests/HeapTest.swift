//
//  HeapTest.swift
//  SwiftTests
//
//  Created by Wayne Bishop on 9/14/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class HeapTest: XCTestCase, Sortable {
    

   //test sequences
   let numbers: Array<Int> = [5, 3, 7, 1, 9, 8]
   let characters: [Character] = ["E", "x", "a", "m", "p", "l", "e"]
    
    
    override func setUp() {
        super.setUp()
    }
    
    

    //test for min-heap property
    func testNumericMinHeap() {
        
        
        //initialize as min-heap instance - default
        let minHeap = Heap<Int>()

        
        //heapify
        for item in numbers {
            minHeap.enQueue(item)
        }
                
        //test for min-heap property
        XCTAssertTrue(minHeap.peek() == numbers.min(), "test failed: array structure violates and min-heap property")
        
    }
    
    
    //test for max-heap property
    func testNumericMaxHeap() {
        
        //initialize as min-heap instance - default
        let maxHeap = Heap<Int>(type: .Max)
        
        
        //heapify
        for item in numbers {
            maxHeap.enQueue(item)
        }
        
        //test for min-heap property
        XCTAssertTrue(maxHeap.peek() == numbers.max(), "test failed: array structure violates and max-heap property")
        
    }
    
    
    //test
    
    
}
