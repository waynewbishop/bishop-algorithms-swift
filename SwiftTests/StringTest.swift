//
//  StringTest.swift
//  SwiftTests
//
//  Created by Wayne Bishop on 10/21/19.
//  Copyright © 2019 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class StringTest: XCTestCase {
    
    var element = "Wayne"

    override func setUp() {
        //set up code goes here..
    }

    
    
    func testReverseWithStack() {
        let results = element.reverseWithStack()
        print(results)
    }
    
    
}
