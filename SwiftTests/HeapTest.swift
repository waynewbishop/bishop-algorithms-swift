//
//  HeapTest.swift
//  SwiftTests
//
//  Created by Wayne Bishop on 9/14/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class HeapTest: XCTestCase {
    

   let numbers: Array<Int> = [5, 3, 7, 1, 9, 8]
   let letters: [Character] = ["E", "x", "a", "m", "p", "l", "e"]
    
    
    override func setUp() {
        super.setUp()
    }
    
    
    //MARK: Numeric Tests
    

    func testNumericMinHeap() {
        
        
        let minHeap = Heap<Int>()

        
        //heapify
        for item in numbers {
            minHeap.enQueue(item)
        }
                
        //test for min heap property
        XCTAssertTrue(minHeap.peek() == numbers.min(), "test failed: array structure violates min-heap property")
        
    }
    
    
    //test for max-heap property
    func testNumericMaxHeap() {
        
        let maxHeap = Heap<Int>(type: .Max)
        
        
        //heapify
        for item in numbers {
            maxHeap.enQueue(item)
        }
        
        //test for min heap property
        XCTAssertTrue(maxHeap.peek() == numbers.max(), "test failed: array structure violates max-heap property")
        
    }
    
    
    //MARK: Character Tests
    
    
    func testCharacterMinHeap() {
        
        let minHeap = Heap<Character>()
        
        
        //heapify
        for item in letters {
            minHeap.enQueue(item)
        }
        
        //test for min heap property
        XCTAssertTrue(minHeap.peek() == letters.min(), "test failed: array structure violates min heap property")
        
    }
    
    
    
    func testCharacterMaxHeap() {
        
        let maxHeap = Heap<Character>(type: .Max)
        
        
        //heapify
        for item in letters {
            maxHeap.enQueue(item)
        }
        
        //test for max heap property
        XCTAssertTrue(maxHeap.peek() == letters.max(), "test failed: array structure violates max-heap property")
        
    }
    
    
    
}
