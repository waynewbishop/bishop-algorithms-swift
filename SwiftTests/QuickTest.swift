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
        buildQuickResults(with: results)
    }
    
    
    
    func testDecendingQSort() {

        
        var sequence: Array<Int> = [8, 7, 6, 5, 4, 3, 2, 1]
        let results = sequence.quickSort()
        
        
        //evaluate results
        buildQuickResults(with: results)
        
    }
    
    
    
    
    //MARK: Helper function
    
    func buildQuickResults(with sequence: Array<Int>) {
        
        print("quick sort results: \(sequence)")
        XCTAssertTrue(isSorted(sequence), "test failed: sequence not sorted: " + String(sequence))
    }
    
}
