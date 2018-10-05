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
    
    
    //test input types for algorithms
    var numberList = [8, 2, 10, 9, 7, 5]
    var searchList = [0,4,7,9,13,16,34]
    var trivialNumberList = [1]
    var emptyNumberList: Array<Int> = []
    var textList = ["Dog", "Cat", "Dinasour", "Lion", "Cheetah", "Gazelle", "Elephant", "Aardvark"]
    var triviaTextList = ["Dog"]
    var emptyTextList: Array<String> = []
    
    //string extension
    var dateList: Array<Date> = ["12-10-2016".datevalue, "12-08-2016".datevalue, "12-09-2016".datevalue]
    
    
    override func setUp() {
        super.setUp()
    }
    
    func testLongestSequence() {
        
        let list = [0,1,0,1,1,1,0,1,1,1,1,1]
        let results = list.longestSequence(of: 1)
        
        print("the longest sequence is \(results)")        
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

    
    func testBinaryNotFound() {
        
        let key: Int = 8
        
        //test for false positive
        XCTAssertFalse(searchList.binarySearch(forElement: key), "binary key value \(key) found..")
    }
   
    
    func testBinaryFound() {
        
        let key: Int = 9
        
        XCTAssertTrue(searchList.binarySearch(forElement: key), "binary key value \(key) not found..")
    }
    

    //MARK: General Sorting Algorithms
    
    
    func testInsertionSort() {
        
        XCTAssertTrue(isSorted(numberList.insertionSort()))
        XCTAssertTrue(isSorted(trivialNumberList.insertionSort()))
        XCTAssertTrue(isSorted(emptyNumberList.insertionSort()))
        XCTAssertTrue(isSorted(textList.insertionSort()))
        XCTAssertTrue(isSorted(triviaTextList.insertionSort()))
        XCTAssertTrue(isSorted(emptyTextList.insertionSort()))
        XCTAssert(isSorted(dateList.insertionSort()))
    }
    
    
    
    func testBubbleSort() {
        
        XCTAssertTrue(isSorted(numberList.bubbleSort()))
        XCTAssertTrue(isSorted(trivialNumberList.bubbleSort()))
        XCTAssertTrue(isSorted(emptyNumberList.bubbleSort()))
        XCTAssertTrue(isSorted(textList.bubbleSort()))
        XCTAssertTrue(isSorted(triviaTextList.bubbleSort()))
        XCTAssertTrue(isSorted(emptyTextList.bubbleSort()))
        XCTAssert(isSorted(dateList.bubbleSort()))
        
    }

    
    
    func testSelectionSort() {
        
        XCTAssertTrue(isSorted(numberList.selectionSort()))
        XCTAssertTrue(isSorted(trivialNumberList.selectionSort()))
        XCTAssertTrue(isSorted(emptyNumberList.selectionSort()))
        XCTAssertTrue(isSorted(textList.selectionSort()))
        XCTAssertTrue(isSorted(triviaTextList.selectionSort()))
        XCTAssertTrue(isSorted(emptyTextList.selectionSort()))
        XCTAssert(isSorted(dateList.selectionSort()))
        
    }
    
    
}
