//
//  enumTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 4/25/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import XCTest


@testable import SwiftStructures


//TODO: Refactor this test class so that it works like the tree balancing tests..

    
    class enumsTest: XCTestCase, Sortable {
 
        
        let list = Algorithm.Sequence([8, 2, 10, 9, 7, 5])
        
        
        override func setUp() {
            super.setUp()
        }
        
        
        func testInsertModel() {
            
            
            //build model
            let enumModel = EnumModel()
            let model = Algorithm.InsertionSort(list)
            
            let results = enumModel.evaluate(withModel: model)
            
            guard results != nil else {
                XCTFail("error: sorted list not found")
                return
            }
            
            XCTAssertTrue(self.isSorted(results!), "list values incorrectly sorted..")
            
        }
        
        
    }





