//
//  enumTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 4/25/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import XCTest


@testable import SwiftStructures


/*
 notes: this test class adopts the Sortable protocol. as a result,
 the isSorted function originates from the protocol extension.
 */

    
    class enumsTest: XCTestCase, Sortable {
 
        
        let list = Algorithm.Elements([8, 2, 10, 9, 7, 5])
        
        
        override func setUp() {
            super.setUp()
        }

        
        //model for insertion sort algorithm
        func testInsertModel() {
            
            let model = Algorithm.InsertionSort(list)
            self.buildEnumModel(withModel: model)

        }
        
        
        //model for insertion sort (with text)
        func testInsertTextModel() {
            
            let textList = Algorithm.Elements(["Dog", "Cat", "Dinasour", "Lion", "Cheetah", "Elephant", "Aardvark"])
            
            let model = Algorithm.InsertionSort(textList)
            self.buildEnumModel(withModel: model)
            
        }

        
        //model for bubble sort algorithm
        func testBubbleModel() {
            
            let model = Algorithm.BubbleSort(list)
            self.buildEnumModel(withModel: model)
            
        }

        
        //model for selection sort algorithm
        func testSelectionModel() {
            
            let model = Algorithm.SelectionSort(list)
            self.buildEnumModel(withModel: model)
            
        }
        
        
        
        //MARK: Helper Function
        
        
        //helper function - test enum model
        func buildEnumModel<T: Comparable>(withModel model: Algorithm<T>) {
            
            let enumModel = EnumModel()
            let results = enumModel.evaluate(withModel: model)
            
            
            XCTAssertTrue(self.isSorted(results!), "list values incorrectly sorted..")
        }
        
        
    }





