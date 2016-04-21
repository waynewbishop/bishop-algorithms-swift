//
//  enumsTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 4/21/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class enumsTest: XCTestCase {
    
    
    var enumModel: EnumModel = EnumModel()

    
    override func setUp() {
        super.setUp()
    }
    
    
    //test for insertion sort
    func testInsertionSort() {
        
        
        //initialize
        let numberList = Algorithm.Sequence([8, 2, 10, 9, 7, 5])
        let result = Algorithm.InsertionSort(numberList)

        
        //evaluate results
        let resultsList = enumModel.evaluate(result)
        print(resultsList)
        
        
    }
    
}
