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
    private var sortTest: Sorting!
    

    
    override func setUp() {
        super.setUp()
        numberList = [8, 2, 10, 9, 7, 5]
        sortTest = Sorting()
    }
    
    
    
    //MARK: - Binary Search Algorithms
    

    func testBinarySearch() {
        
        var searchList: Array<Int> = Array<Int>()
        

        //populate collection..
        for number in 0...500 {
            searchList.append(number)
        }
        
        //perform theoretical search
        sortTest.binarySearch(searchList, key: 235)
        
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
        
        //evaluate results
        XCTAssertTrue(self.IsSorted(resultList), "item sequence not in sorted order..")
        
    }
    
    
    
    func testBubbleSort() {
        
        let resultList: Array<Int> = sortTest.bubbleSort(numberList)
                
        //evaluate results
        XCTAssertTrue(self.IsSorted(resultList), "item sequence not in sorted order..")
        
    }

    
    
    func testSelectionSort() {
        
        let resultList: Array<Int> = sortTest.selectionSort(numberList)
      
        //evaulate results
        XCTAssertTrue(self.IsSorted(resultList), "item sequence not in sorted order..")
        
        
    }
    
    
    
    func testQuickSort() {
        
        let resultList: Array<Int> = sortTest.quickSort(numberList)
        
        //evaluate results
        XCTAssertTrue(self.IsSorted(resultList), "item sequence not in sorted order..")
        
    }
    
    
    
    func testMergeSort() {
        
        let resultList: Array<Int> = sortTest.mergeSort(numberList)
        
        //evaluate results
        XCTAssertTrue(self.IsSorted(resultList), "item sequence not in sorted order..")
        
    }
    
    
    
    //MARK: Helper Function
    
    
    //determine sorted list
    func IsSorted(sequence: Array<Int>) -> Bool {
        
        
        for var primaryIndex = 0; primaryIndex < sequence.count; primaryIndex++ {
            
            //test sequence
            if (primaryIndex > 0 && sequence[primaryIndex] < sequence[primaryIndex - 1]) {
                return false
            }
            
        }
        
        return true
        
    }
    
    

    
}
