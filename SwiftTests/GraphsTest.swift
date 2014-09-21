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
    func testBuildGraph() {
        
        
        //build the vertices
        vertexA = testGraph.addVertex(key: "A")
        vertexB = testGraph.addVertex(key: "B")
        vertexC = testGraph.addVertex(key: "C")
        vertexD = testGraph.addVertex(key: "D")
        vertexE = testGraph.addVertex(key: "E")
        
        
        //connect the vertices with weighted edges
        testGraph.addEdge(source: vertexA, neighbor: vertexD, weight: 4)
        testGraph.addEdge(source: vertexA, neighbor: vertexB, weight: 1)
        testGraph.addEdge(source: vertexB, neighbor: vertexD, weight: 5)
        testGraph.addEdge(source: vertexB, neighbor: vertexC, weight: 2)
        testGraph.addEdge(source: vertexD, neighbor: vertexE, weight: 8)


        //validate neighbor association
        if (neighborTest(vertexA, neighbor: vertexD) == false) {
            XCTFail("\(vertexD.key!) is not neighbor of \(vertexA.key!)")
        }
        
        if (neighborTest(vertexA, neighbor: vertexB) == false) {
            XCTFail("\(vertexB.key) is not a neighbor of \(vertexA)")
        }
        
        
        
    }
    
    
    
    /* helper function to check for neighbor membership */
    
    func neighborTest(source: Vertex, neighbor: Vertex) -> Bool {
        
        //add unvisited vertices to the queue
        for e in source.neighbors {
            if (e.neighbor.key == neighbor.key) {
                return true
            }
        }
        
        return false
        
    }
  
    
    
} //end class
