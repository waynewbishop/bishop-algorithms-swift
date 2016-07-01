//
//  GraphsTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/19/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

@testable import SwiftStructures


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
        
        neighborTest(of: vertexA, with: vertexD)
        neighborTest(of: vertexA, with: vertexB)
        neighborTest(of: vertexB, with: vertexD)
        neighborTest(of: vertexB, with: vertexC)
        neighborTest(of: vertexD, with: vertexE)
    }
    
    
    
    //find the shortest path using heapsort operations - O(1)
    func testDijkstraWithHeaps() {
        
        let sourceVertex = vertexA
        let destinationVertex = vertexE
        
        
        let shortestPath: Path! = testGraph.processDijkstraWithHeap(sourceVertex!, destination: destinationVertex!)
        XCTAssertNotNil(shortestPath, "shortest path not found..")
        
        printPath(shortestPath)

        
    }
    
    
    
    
    //find the shortest path based on two non-negative edge weights - O(n)
    func testDijkstra() {
        
        let sourceVertex = vertexA
        let destinationVertex = vertexE

        
        let shortestPath: Path! = testGraph.processDijkstra(sourceVertex!, destination: destinationVertex!)
        XCTAssertNotNil(shortestPath, "shortest path not found..")
        
        printPath(shortestPath)
        
        
    }

    
    //MARK: Closures and traversals
 
    
    //breadth-first search
    func testBFSTraverse() {
        testGraph.traverse(vertexA)
    }
    
    
    //breadth-first search with function
    func testBFSTraverseFunction() {
        testGraph.traverse(vertexA, formula: traverseFormula)
    }

    
    
    //breadth-first search with closure expression
    func testBFSTraverseExpression() {
        
        /*
        notes: the inout parameter is passed by reference.
        As a result, no return type is required. Also note the trailing closure syntax.
        */

        testGraph.traverse(vertexA) { ( node: inout Vertex) -> () in
            
            node.visited = true
            print("traversed vertex: \(node.key!)..")
            
        }
        
        
    }
    

    
    //closure function passed as parameter
    func traverseFormula(node: inout Vertex) -> () {
        
        /*
        notes: the inout parameter is passed by reference. 
        As a result, no return type is required.
        */
        
        node.visited = true
        print("traversed vertex: \(node.key!)..")
    }

    
    
    
    //MARK: - Helper function
    
    
    //check for membership
    func neighborTest(of source: Vertex, with neighbor: Vertex) {

        
        //add unvisited vertices to the queue
        for e in source.neighbors {
            if (e.neighbor.key == neighbor.key) {
                return
            }
        }
        
        XCTFail("vertex \(neighbor.key!) is not a neighbor of vertex \(source.key!)")
        
    }
    
    
    //reverse a path data structure
    func printPath(_ shortestPath: Path!) {

        
        var reversedPath: Path! = Path()
        var current: Path! = Path()
        
        
        //reverse the sequence of paths
        reversedPath = testGraph.reversePath(shortestPath, source: vertexA)
        current = reversedPath
        
        
        //iterate and print each path sequence
        while (current != nil) {
            print("The path is : \(current.destination.key!) with a total of : \(current.total)..")
            current = current.previous
        }

        
        
    }
  
    
    
} //end class
