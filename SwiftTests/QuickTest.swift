//
//  QuickTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/16/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class QuickTest: XCTestCase, Sortable {
    
    override func setUp() {
        super.setUp()
    }
    

    
    //best case - O(n log(n))
    func testSplitQSort() {
        
        
        /*
         note: the order of unsorted numbers represents the best case because
         the last item in the collection (4) will be used as a initial pivot.
         As a result, the left and right partitions will be equally split.
        */

        var sequence: Array<Int> = [7, 2, 1, 6, 8, 5, 3, 4]
        let results = sequence.quickSort()
        
        //evaluate results
        processQuickResults(with: results)
    }
    
    
    //worst case scenario -
    func testDecendingQSort() {
        
        var sequence: Array<Int> = [8, 7, 6, 5, 4, 3, 2, 1]
        let results = sequence.quickSort()
        
        //evaluate results
        processQuickResults(with: results)
    }
    
    
    func testAscendingQSort() {
        
        var sequence: Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8]
        let results = sequence.quickSort()
        
        //evaluate results
        processQuickResults(with: results)
    }
    
    
    
    //test with random numbers
    func testRandomNumberQSort() {
        
        var sequence: Array<Int> = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]
        
        let results = sequence.quickSort()
        
        //evaluate results
        processQuickResults(with: results)
    }
    
    
    //test example with comparable dates
    func testDatesQSort() {

        
        //create random dates - extension
        let pastdate: Date = "05-13-2016".datevalue
        let nowdate: Date = "12-12-2016".datevalue
        let futuredate: Date = "01-16-2017".datevalue
        
        
        var sequence: Array<Date> = [nowdate, futuredate, pastdate]
        let results = sequence.quickSort()
        
        
        //evaluate results
        processQuickResults(with: results)
        
    }
    
    
    //MARK: Helper function
    
    func processQuickResults<T: Comparable>(with sequence: Array<T>) {
        print("quick sort results: \(sequence)")
        XCTAssertTrue(isSorted(sequence), "test failed: sequence not sorted: " + String(describing: sequence))
    }
    
}
