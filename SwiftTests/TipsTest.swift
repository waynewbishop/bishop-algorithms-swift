//
//  TipsTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 4/8/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import XCTest

class TipsTest: XCTestCase {

    var numberList: Array<Int>!
    
    
    override func setUp() {
        super.setUp()
        
        numberList = [8, 2, 10, 9, 7, 5]
    }
    
    
    //MARK: - alternate methods for dealing with c-style loops

    
    /* implement looping structure using the half-open operator */

    func testBasicLoops() {
    
        
        //basic loop
        for index in 0..<5 {
            print(index)
        }

    
        //forward enumeration
        for index in 0..<numberList.count {
            print(numberList[index])
        }

        
    }
    
    
    /* implement looping structure using strideable elements */

    func testStrideLoops() {

        
        //basic stride loop
        for index in 0.stride(through: 5, by: 1) {
            print(index)
        }
        
        //reverse stride loop
        for index in 10.stride(through: 0, by: -2) {
            print(index)
        }

        //forward stride enumeration
        for index in 0.stride(through: numberList.endIndex - 1, by: 1) {
            print(numberList[index])
        }
        
        
        //reverse stride enumeration
        for index in (numberList.endIndex - 1).stride(through: 0, by: -1) {
            print(numberList[index])
        }
        
    }
    
    
}
