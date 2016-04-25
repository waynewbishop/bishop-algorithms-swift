//
//  enumTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 4/25/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import XCTest


@testable import SwiftStructures
    
    
    class enumsTest: XCTestCase {
        
        
        let enumModel: EnumModel = EnumModel()
        
        
        override func setUp() {
            super.setUp()
        }
        
    
        //build and evaluate algorithm model
        func testInsertionSort() {
            
            
            //build model
            let numberList = Algorithm.Sequence([8, 2, 10, 9, 7, 5])
            let model = Algorithm.InsertionSort(numberList)
            
            
            //evaluate results
            let results = enumModel.evaluate(model)
            print(results)
            
            
        }
        
    }


