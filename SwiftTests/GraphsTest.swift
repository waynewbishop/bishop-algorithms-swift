//
//  GraphsTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/19/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

/* unit test cases specific to graph algorithms */

class GraphsTest: XCTestCase {

    var testGraph: SwiftGraph = SwiftGraph()
    
    var vertexA: Vertex!
    var vertexB: Vertex!
    var vertexC: Vertex!
    var vertexD: Vertex!
    var vertexE: Vertex!

    
    //add the vertices to the graph
    func testAddVerticies() {
        
        vertexA = testGraph.addVertex(key: "A")
        XCTAssertNotNil(vertexA, "vertex not initialized..")
        
        vertexB = testGraph.addVertex(key: "B")
        XCTAssertNotNil(vertexB, "vertext not initialized..")
        
        vertexC = testGraph.addVertex(key: "C")
        
        
        vertexD = testGraph.addVertex(key: "D")
        vertexE = testGraph.addVertex(key: "E")
    }
  
    
}
