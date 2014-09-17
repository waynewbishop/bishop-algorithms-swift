//
//  EdgeTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/17/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

class EdgeTest: XCTestCase {

    var edgeTest: Edge = Edge()
    
    func testInstance() {
        
        XCTAssertNotNil(edgeTest, "instance not initialized..")
        XCTAssertEqual(edgeTest.weight, 0, "edge weight not initialized..")
        
        var testVertex: AnyObject = edgeTest.neighbor as AnyObject
        if !(testVertex is Vertex) {
            XCTFail("edge vertex not intialized..")
        }
        
    }
    
}
