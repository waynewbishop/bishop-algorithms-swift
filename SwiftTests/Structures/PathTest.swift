//
//  PathTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/17/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

class PathTest: XCTestCase {
    
    var pathTest: Path = Path()

    func testInstance() {
        
        XCTAssertNotNil(pathTest, "instance not initialized..")
        XCTAssertNil(pathTest.previous, "path previous property not initialized..")
        XCTAssertNil(pathTest.total, "path total property not initialized..")
        
        var testVertex: AnyObject = pathTest.destination as AnyObject
        if !(testVertex is Vertex) {
            XCTFail("destination vertex not intialized..")
        }
        
        
    }
    
}
