//
//  BinarySearchTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/23/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

@testable import SwiftStructures


/*
 notes: this test class adopts the Sortable protocol.
 the isSorted function originates from the protocol extension.
*/


class SortingTest: XCTestCase, Sortable {
    
    
    var numberList = [8, 2, 10, 9, 7, 5]
    var trivialNumberList = [1] //single element
    var emptyNumberList: Array<Int> = []
    var textList = ["Dog", "Cat", "Dinasour", "Lion", "Cheetah", "Gazelle", "Elephant", "Aardvark"]
    var triviaTextList = ["Dog"]
    var emptyTextList: Array<String> = []
    
    
    override func setUp() {
        super.setUp()
    }
    

    
    //MARK: - Binary Search Algorithms
    

    func testBinarySearch() {
        
        var searchList = Array<Int>()
        let key: Int = 235

        
        //populate collection..
        for number in 0...500 {
            searchList.append(number)
        }
        
        
        XCTAssertTrue(self.isSorted(searchList), "search list of values not sorted..")
        
        
        //perform test search
        XCTAssertTrue(searchList.binarySearch(forElement: key), "binary key value \(key) not found..")
        
    }

    
    func testBinaryTestNotFound() {
        
        var searchList: Array<Int> = [0,4,7,9,13,16,34]
        let key: Int = 8
        
        //test for false positive
        XCTAssertFalse(searchList.binarySearch(forElement: key), "binary key value \(key) found..")
    }
    
    
    func testQuickSort() {
        
        //let searchList: Array<Int> = [6,5,1,3,8,4,7,2]
        let numberList = [8, 2, 10, 9, 7, 5]
        
        
        let results = numberList.quickSort()
        print("the results are: \(results)")
        
    }
    
    


    //MARK: General Sorting Algorithms
    
    
    func testInsertionSort() {
        
        XCTAssertTrue(self.isSorted(numberList.insertionSort()))
        XCTAssertTrue(self.isSorted(trivialNumberList.insertionSort()))
        XCTAssertTrue(self.isSorted(emptyNumberList.insertionSort()))
        XCTAssertTrue(self.isSorted(textList.insertionSort()))
        XCTAssertTrue(self.isSorted(triviaTextList.insertionSort()))
        XCTAssertTrue(self.isSorted(emptyTextList.insertionSort()))
    }
    
    
    
    func testBubbleSort() {
        
        XCTAssertTrue(self.isSorted(numberList.bubbleSort()))
        XCTAssertTrue(self.isSorted(trivialNumberList.bubbleSort()))
        XCTAssertTrue(self.isSorted(emptyNumberList.bubbleSort()))
        XCTAssertTrue(self.isSorted(textList.bubbleSort()))
        XCTAssertTrue(self.isSorted(triviaTextList.bubbleSort()))
        XCTAssertTrue(self.isSorted(emptyTextList.bubbleSort()))
    }

    
    
    func testSelectionSort() {
        
        XCTAssertTrue(self.isSorted(numberList.selectionSort()))
        XCTAssertTrue(self.isSorted(trivialNumberList.selectionSort()))
        XCTAssertTrue(self.isSorted(emptyNumberList.selectionSort()))
        XCTAssertTrue(self.isSorted(textList.selectionSort()))
        XCTAssertTrue(self.isSorted(triviaTextList.selectionSort()))
        XCTAssertTrue(self.isSorted(emptyTextList.selectionSort()))
    }
    
    
}
