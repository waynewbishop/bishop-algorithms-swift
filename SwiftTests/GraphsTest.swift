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
    
    
    //called before each test invocation
    override func setUp() {
        super.setUp()
        
        /* build the vertices */
        
        vertexA = testGraph.addVertex(key: "A")
        vertexB = testGraph.addVertex(key: "B")
        vertexC = testGraph.addVertex(key: "C")
        vertexD = testGraph.addVertex(key: "D")
        vertexE = testGraph.addVertex(key: "E")
        
        
        /* connect the vertices with weighted edges */
        
        testGraph.addEdge(source: vertexA, neighbor: vertexD, weight: 4)
        testGraph.addEdge(source: vertexA, neighbor: vertexB, weight: 1)
        testGraph.addEdge(source: vertexB, neighbor: vertexD, weight: 5)
        testGraph.addEdge(source: vertexB, neighbor: vertexC, weight: 2)
        testGraph.addEdge(source: vertexD, neighbor: vertexE, weight: 8)

    }
    
    
    //validate neighbor association
    func testVertexNeighbors() {

        neighborTest(vertexA, neighbor: vertexD)
        neighborTest(vertexA, neighbor: vertexB)
        neighborTest(vertexB, neighbor: vertexD)
        neighborTest(vertexB, neighbor: vertexC)
        neighborTest(vertexD, neighbor: vertexE)
        
    }
    
    
    
    //return the shortest path based on two non-negative edge weights
    func testDijkstra() {
        
        
        var sourceVertex: Vertex = vertexA
        var destinationVertex: Vertex = vertexE

        
        //return the optional shortest path
        var shortestPath: Path! = testGraph.processDijkstra(sourceVertex, destination: destinationVertex)

        
        //reverse the sequence of the shortest path
        self.reversePathSequence(shortestPath, source: sourceVertex)
        
    }
    
    
    //MARK: - Helper functions

    
    /* reverse the path shortest path sequence */
    
    func reversePathSequence(var head: Path!, source: Vertex) -> Path! {
        
        if (head == nil) {
            return nil;
        }
        
        
        var current: Path! = head
        var prev: Path! = Path()
        var next: Path! = Path()
        
        
        while(current != nil) {
            next = current.previous
            current.previous = prev
            prev = current
            current = next
        }

        
        //append the source path to the sequence
        var sourcePath: Path = Path()

        sourcePath.destination = source
        sourcePath.previous = prev
        sourcePath.total = nil
        
        head = sourcePath
        
        
        return head
        
    }
    
    
    
    
    /* helper function to check for neighbor membership */
    
    func neighborTest(source: Vertex, neighbor: Vertex) -> Bool! {
        
        //add unvisited vertices to the queue
        for e in source.neighbors {
            if (e.neighbor.key == neighbor.key) {
                return true
            }
        }
        
        XCTFail("vertex \(neighbor.key!) is not a neighbor of vertext \(source.key!)")
        return nil;
        
    }
  
    
    
} //end class
