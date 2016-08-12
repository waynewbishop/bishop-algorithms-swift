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
    
        var searchList: Array<Int>  = [7, 2, 1, 6, 8, 5, 3, 4]
        searchList.qSort(0, searchList.endIndex - 1)
        
        print("The results are: \(searchList)")
    }
    
    

    //MARK: General Sorting Algorithms
    
    
    func testInsertionSort() {
        
        XCTAssertTrue(isSorted(numberList.insertionSort()))
        XCTAssertTrue(isSorted(trivialNumberList.insertionSort()))
        XCTAssertTrue(isSorted(emptyNumberList.insertionSort()))
        XCTAssertTrue(isSorted(textList.insertionSort()))
        XCTAssertTrue(isSorted(triviaTextList.insertionSort()))
        XCTAssertTrue(isSorted(emptyTextList.insertionSort()))
    }
    
    
    
    func testBubbleSort() {
        
        XCTAssertTrue(isSorted(numberList.bubbleSort()))
        XCTAssertTrue(isSorted(trivialNumberList.bubbleSort()))
        XCTAssertTrue(isSorted(emptyNumberList.bubbleSort()))
        XCTAssertTrue(isSorted(textList.bubbleSort()))
        XCTAssertTrue(isSorted(triviaTextList.bubbleSort()))
        XCTAssertTrue(isSorted(emptyTextList.bubbleSort()))
    }

    
    
    func testSelectionSort() {
        
        XCTAssertTrue(isSorted(numberList.selectionSort()))
        XCTAssertTrue(isSorted(trivialNumberList.selectionSort()))
        XCTAssertTrue(isSorted(emptyNumberList.selectionSort()))
        XCTAssertTrue(isSorted(textList.selectionSort()))
        XCTAssertTrue(isSorted(triviaTextList.selectionSort()))
        XCTAssertTrue(isSorted(emptyTextList.selectionSort()))
    }
    
    
}
