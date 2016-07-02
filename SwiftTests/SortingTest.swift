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
 notes: This test class adopts the Sortable protocol 
*/


class SortingTest: XCTestCase, Sortable {

    
    var sortTest = Sorting()
    
    
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
        
        var searchList: Array<Int> = Array<Int>()
        let key: Int = 235

        
        //populate collection..
        for number in 0...500 {
            searchList.append(number)
        }
        
        //perform test search
        XCTAssertTrue(sortTest.binarySearch(searchList, key), "binary key value \(key) not found..")
        
    }

    
    func testBinaryTestNotFound() {
        
        let searchList: Array<Int> = [0,4,7,9,13,16,34]
        let key: Int = 8
        
        //test for false positive
        XCTAssertFalse(sortTest.binarySearch(searchList, key), "binary key value \(key) found..")
    }
    
    
	

    //MARK: General Sorting Algorithms
    
    
    func testInsertionSort() {
        
        let resultList: Array<Int> = sortTest.insertionSort(numberList)
        let triviaResultList: Array<Int> = sortTest.insertionSort(trivialNumberList)
        let emptyResultList: Array<Int> = sortTest.insertionSort(emptyNumberList)
        let sequence = sortTest.insertionSortG(textList)
        let triviaSequence = sortTest.insertionSortG(triviaTextList)
        let emptySequence = sortTest.insertionSortG(emptyTextList)
        
        //evaluate results
        XCTAssertTrue(isSorted(resultList), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(triviaResultList), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(emptyResultList), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(sequence), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(triviaSequence), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(emptySequence), "item sequence not in sorted order..")
    }
    
    
    
    func testBubbleSort() {
        
        let resultsList: Array<Int> = sortTest.bubbleSort(numberList)
        let triviaResultList: Array<Int> = sortTest.insertionSort(trivialNumberList)
        let emptyResultList: Array<Int> = sortTest.insertionSort(emptyNumberList)
        let sequence = sortTest.bubbleSortG(textList)
        let triviaSequence = sortTest.insertionSortG(triviaTextList)
        let emptySequence = sortTest.insertionSortG(emptyTextList)
        
        //evaluate results
        XCTAssertTrue(isSorted(resultsList), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(triviaResultList), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(emptyResultList), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(sequence), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(triviaSequence), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(emptySequence), "item sequence not in sorted order..")
    }

    
    
    func testSelectionSort() {
        
        let resultList: Array<Int> = sortTest.selectionSort(numberList)
        let triviaResultList: Array<Int> = sortTest.insertionSort(trivialNumberList)
        let emptyResultList: Array<Int> = sortTest.insertionSort(emptyNumberList)
        let sequence = sortTest.insertionSortG(textList)
        let triviaSequence = sortTest.insertionSortG(triviaTextList)
        let emptySequence = sortTest.insertionSortG(emptyTextList)
      
        
        //evaulate results
        XCTAssertTrue(isSorted(resultList), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(triviaResultList), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(emptyResultList), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(sequence), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(triviaSequence), "item sequence not in sorted order..")
        XCTAssertTrue(isSorted(emptySequence), "item sequence not in sorted order..")
    }
    
    
}
