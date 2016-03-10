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


class SortingTest: XCTestCase {

    
    private var numberList: Array<Int>!
    private var triviaNumberList: Array<Int>!
    private var emptyNumberList: Array<Int>!
    private var textList: Array<String>!
    private var triviaTextList: Array<String>!
    private var emptyTextList: Array<String>!
    private var sortTest: Sorting!

    
    override func setUp() {
        super.setUp()
        
        numberList = [8, 2, 10, 9, 7, 5]
        triviaNumberList = [1] // Should have just one element
        emptyNumberList = []
        textList = ["Dog", "Cat", "Dinasour", "Lion", "Cheetah", "Gazelle", "Elephant", "Aardvark"]
        triviaTextList = ["Dog"]
        emptyTextList = []
        sortTest = Sorting()
    }
    
    
    
    //MARK: - Binary Search Algorithms
    

    func testBinarySearch() {
        
        var searchList = Array<Int>()
        var firstHalfOfList =  Array<Int>()
        var secondHalfOfList =  Array<Int>()

        //populate collection 0-399 and then 401-500 (missing 400 for testing the missing value condition)
        for number in 0...399 {
            firstHalfOfList.append(number)
        }
        for number in 401...500 {
            secondHalfOfList.append(number)
        }
        
        //combine the two halves into the full search list
        searchList = firstHalfOfList + secondHalfOfList
        
        //search for existing keys within range of the array
        let resultListFirstHalf = firstHalfOfList.map{sortTest.binarySearch(searchList, key: $0)}
        
        for result in resultListFirstHalf {
            XCTAssertTrue(result)
        }
        
        //search for existing keys within range of the array
        let resultListSecondHalf = secondHalfOfList.map{sortTest.binarySearch(searchList, key: $0)}
        
        for result in resultListSecondHalf {
            XCTAssertTrue(result)
        }
        
        //search for non-existent key within range of the array
        XCTAssertFalse(sortTest.binarySearch(searchList, key: 400))
        
        //search for key outside the range of the array
        XCTAssertFalse(sortTest.binarySearch(searchList, key: 600))

    }
    


    /*
    modified binary search algorithm.
    makes use of closure expression to pass state information
    */
    
    func testBinarySearchClosure() {
        
        
        var searchList: Array<Int> = Array<Int>()
        var isFound: Bool = false
        let key: Int = 235
        

        //populate collection..
        for number in 0...500 {
            searchList.append(number)
        }
        
        
        //capture state with trailing closure
        sortTest.binarySearch(searchList, key: key) { (found: Bool) -> Void in
            isFound = found
        }
        
        
        XCTAssertTrue(isFound, "value \(key) not found..")
        
        
    }
    
    
	
    //MARK: General Sorting Algorithms
	
    
    func testInsertionSort() {
        
        let resultList: Array<Int> = sortTest.insertionSort(numberList)
        let triviaResultList: Array<Int> = sortTest.insertionSort(triviaNumberList)
        let emptyResultList: Array<Int> = sortTest.insertionSort(emptyNumberList)
        let sequence = sortTest.insertionSortG(textList)
        let triviaSequence = sortTest.insertionSortG(triviaTextList)
        let emptySequence = sortTest.insertionSortG(emptyTextList)
        
        //evaluate results
        XCTAssertTrue(self.IsSorted(resultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(triviaResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(emptyResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(sequence), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(triviaSequence), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(emptySequence), "item sequence not in sorted order..")
        
    }
    
    
    
    func testBubbleSort() {
        
        let resultsList: Array<Int> = sortTest.bubbleSort(numberList)
        let triviaResultList: Array<Int> = sortTest.insertionSort(triviaNumberList)
        let emptyResultList: Array<Int> = sortTest.insertionSort(emptyNumberList)
        let sequence = sortTest.bubbleSortG(textList)
        let triviaSequence = sortTest.insertionSortG(triviaTextList)
        let emptySequence = sortTest.insertionSortG(emptyTextList)
        
        //evaluate results
        XCTAssertTrue(self.IsSorted(resultsList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(triviaResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(emptyResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(sequence), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(triviaSequence), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(emptySequence), "item sequence not in sorted order..")
    }

    
    
    func testSelectionSort() {
        
        let resultList: Array<Int> = sortTest.selectionSort(numberList)
        let triviaResultList: Array<Int> = sortTest.insertionSort(triviaNumberList)
        let emptyResultList: Array<Int> = sortTest.insertionSort(emptyNumberList)
        let sequence = sortTest.insertionSortG(textList)
        let triviaSequence = sortTest.insertionSortG(triviaTextList)
        let emptySequence = sortTest.insertionSortG(emptyTextList)
      
        
        //evaulate results
        XCTAssertTrue(self.IsSorted(resultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(triviaResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(emptyResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(sequence), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(triviaSequence), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(emptySequence), "item sequence not in sorted order..")
        
    }
    
    
    
    func testQuickSort() {
        
        let resultList: Array<Int> = sortTest.quickSort(numberList)
        let triviaResultList: Array<Int> = sortTest.insertionSort(triviaNumberList)
        let emptyResultList: Array<Int> = sortTest.insertionSort(emptyNumberList)
        
        //evaluate results
        XCTAssertTrue(self.IsSorted(resultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(triviaResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(emptyResultList), "item sequence not in sorted order..")
        
    }
    
    
    
    func testMergeSort() {
        
        let resultList: Array<Int> = sortTest.mergeSort(numberList)
        let triviaResultList: Array<Int> = sortTest.insertionSort(triviaNumberList)
        let emptyResultList: Array<Int> = sortTest.insertionSort(emptyNumberList)
        
        //evaluate results
        XCTAssertTrue(self.IsSorted(resultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(triviaResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.IsSorted(emptyResultList), "item sequence not in sorted order..")
        
    }
    
    
    
    //MARK: Helper Function
    
    
    //generic method to determine sorted order
    func IsSorted<T: Comparable>(sequence: [T]) -> Bool {
        
        guard sequence.count > 1 else { return true } // immediately return true for trivial cases
        
        // after the guard check we are guaranteed that sequence has at least two elements
        
        let rangeFromSecondElement = sequence.startIndex.successor()..<sequence.endIndex
        
        return !rangeFromSecondElement.contains { index in
            
            sequence[index.predecessor()] > sequence[index]
            
        }
        
    }
    
    

    
}
