//
//  GraphsTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/19/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

/* 
   unit test cases specific to graph algorithms
   to test your own graph, replace the vertices and edges.
*/

class GraphTest: XCTestCase {

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
    
    
    
    //find the shortest path using heapsort operations - O(1)
    func testDijkstraWithHeaps() {
        
        var sourceVertex = vertexA
        var destinationVertex = vertexE
        
        
        var shortestPath: Path! = testGraph.processDijkstraWithHeap(sourceVertex, destination: destinationVertex)
        XCTAssertNotNil(shortestPath, "shortest path not found..")
        
        printPath(shortestPath)
        
    }
    
    
    
    
    //find the shortest path based on two non-negative edge weights - O(n)
    func testDijkstra() {
        
        var sourceVertex = vertexA
        var destinationVertex = vertexE

        
        var shortestPath: Path! = testGraph.processDijkstra(sourceVertex, destination: destinationVertex)
        XCTAssertNotNil(shortestPath, "shortest path not found..")
        
        printPath(shortestPath)
        
        
    }

    
    
    
    //test breadth-first search
    func testBFSTraversal() {
        testGraph.traverseGraphBFS(vertexA)
        println()
        
    }
    
    
    
    //MARK: - Helper function

    
    //check for neighbor membership
    func neighborTest(source: Vertex, neighbor: Vertex) -> Bool! {
        
        //add unvisited vertices to the queue
        for e in source.neighbors {
            if (e.neighbor.key == neighbor.key) {
                return true
            }
        }
        
        XCTFail("vertex \(neighbor.key!) is not a neighbor of vertex \(source.key!)")
        return nil;
        
    }
    
    
    //reverse a path data structure
    func printPath(shortestPath: Path!) {

        
        var reversedPath: Path! = Path()
        var current: Path! = Path()
        
        
        //reverse the sequence of paths
        reversedPath = testGraph.reversePath(shortestPath, source: vertexA)
        current = reversedPath
        
        
        //iterate and print each path sequence
        while (current != nil) {
            println("The path is : \(current.destination.key!) with a total of : \(current.total)..")
            current = current.previous
        }

        
        
    }
  
    
    
} //end class
