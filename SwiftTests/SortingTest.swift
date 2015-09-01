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
    
    let numberList : Array<Int> = [8, 2, 10, 9, 7, 5]

    
    //MARK: - Binary Search Algorithm
    

    //test the binary search
    func testBinarySearch() {
        
        let sortTest: Sorting = Sorting()
        var searchList: Array<Int> = Array<Int>()
        XCTAssertNotNil(sortTest, "sorting instance not created..")
        
        
        //populate the list with values
        for number in 1...500 {
            searchList.append(number)
        }
        
        
        //set the key and range (tuple)
        sortTest.binarySearch(searchList, key: 182, range: (1, 500))
        
        //check the indicator
        let isFound: Bool = sortTest.isKeyFound

        XCTAssertTrue(isFound, "binary search key not found..")
        
    }
		
	
    //MARK: Sorting Algorithms
	
	
    func testInsertionSort() {
			
        let sortTest: Sorting = Sorting()
        XCTAssertNotNil(sortTest, "sorting instance not created..")
        
        
        //pass the list to be sorted
        var resultList: Array<Int>! = sortTest.insertionSort(numberList)
        
        
        //determine if the numbers are sorted
        var x: Int = 0
        for (x = 0; x < resultList.count; x++) {
            
            if ((x > 0) && (resultList[x] < resultList[x - 1])) {
                XCTFail("numberlist items not in sorted order..")
            }
            else {
                print("item \(resultList[x]) is sorted..")
            }
            
            
        } //end for
        
        
    } //end function
    
    
    
    func testBubbleSort() {
        
        
        let sortTest: Sorting = Sorting()
        XCTAssertNotNil(sortTest, "sorting instance not created..")
        
        
        //pass the list to be sorted
        var resultList: Array<Int>! = sortTest.bubbleSort(numberList)
        
        
        //determine if the numbers are sorted
        var x: Int = 0
        for (x = 0; x < resultList.count; x++) {
            
            if ((x > 0) && (resultList[x] < resultList[x - 1])) {
                XCTFail("numberlist items not in sorted order..")
            }
            else {
                print("item \(resultList[x]) is sorted..")
            }
            
            
        } //end for
        
        
    } //end function

    
    
    func testSelectionSort() {
        
        
        let sortTest: Sorting = Sorting()
        XCTAssertNotNil(sortTest, "sorting instance not created..")
        
        
        //pass the list to be sorted
        var resultList: Array<Int>! = sortTest.selectionSort(numberList)
        
        
        //determine if the numbers are sorted
        var x: Int = 0
        for (x = 0; x < resultList.count; x++) {
            
            if ((x > 0) && (resultList[x] < resultList[x - 1])) {
                XCTFail("numberlist items not in sorted order..")
            }
            else {
                print("item \(resultList[x]) is sorted..")
            }
            
            
        } //end for
        
        
    } //end function
    
    
    
    func testQuickSort() {
        
        
        let sortTest: Sorting = Sorting()
        XCTAssertNotNil(sortTest, "sorting instance not created..")
        
        var resultList: Array<Int>! = sortTest.quickSort(numberList)
        
        var x: Int = 0
        for (x = 0; x < resultList.count; x++) {
            
            if ((x > 0) && (resultList[x] < resultList[x - 1])) {
                XCTFail("numberlist items not in sorted order..")
            }
            else {
                print("item \(resultList[x]) is sorted..")
            }
            
            
        }
        
    }
    
    func testMergeSort() {
        
        10.times { i in
           // echo "(i) times"
            print("\(i) times")
        }
        

        
        let sortTest: Sorting = Sorting()
        XCTAssertNotNil(sortTest, "sorting instance not created..")
        
        var resultList: Array<Int>! = sortTest.mergeSort(numberList)
        
        var x: Int = 0
        for (x = 0; x < resultList.count; x++) {
            
            if ((x > 0) && (resultList[x] < resultList[x - 1])) {
                XCTFail("numberlist items not in sorted order..")
            }
            else {
                print("item \(resultList[x]) is sorted..")
            }
            
            
        }
        
    }
    

    
    
}
