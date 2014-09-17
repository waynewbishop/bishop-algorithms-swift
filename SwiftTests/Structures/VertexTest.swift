//
//  VertexTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/17/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

class VertexTest: XCTestCase {
    
    var testVertex: Vertex = Vertex()
    
    func testInstance() {
        
        XCTAssertNotNil(testVertex, "instance not intialized..")
        XCTAssertFalse(testVertex.visited, "visited property not intialized..")
        

        //downcast to test for membership
        var neigborList: AnyObject = testVertex.neighbors as AnyObject
        if !(neigborList is Array<Edge>) {
            XCTFail("neighborlist does not include array list of edges..")
        }
        
        
    }
    
    
}
