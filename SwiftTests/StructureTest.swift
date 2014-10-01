//
//  StructuresTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/17/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

class StructureTest: XCTestCase {

    
    func testLLNode() {
        var testNode: LLNode<Int> = LLNode<Int>()
        
        XCTAssertNotNil(testNode, "instance not initialized..")
        XCTAssertNil(testNode.key, "key not initialized..")
        XCTAssertNil(testNode.next, "next node propety not initialized..")
        XCTAssertNil(testNode.previous, "previous node propety not initialized..")
    }

    
    
    func testQNode() {
        var testNode: QNode<Int> = QNode<Int>()
        
        XCTAssertNotNil(testNode, "instance not initialized..")
        XCTAssertNil(testNode.key, "key not initialized..")
        XCTAssertNil(testNode.next, "next instance not initialized..")
    }
    


    func testVertex() {
        
        var testVertex: Vertex = Vertex()
        
        XCTAssertNotNil(testVertex, "instance not intialized..")
        XCTAssertFalse(testVertex.visited, "visited property not intialized..")
        
        
        //downcast to test for membership
        var neigborList: AnyObject = testVertex.neighbors as AnyObject
        if !(neigborList is Array<Edge>) {
            XCTFail("neighborlist does not include array list of edges..")
        }
        
    }

    
    
    func testEdge() {
        
        var edgeTest: Edge = Edge()
        
        XCTAssertNotNil(edgeTest, "instance not initialized..")
        XCTAssertEqual(edgeTest.weight, 0, "edge weight not initialized..")
        
        var testVertex: AnyObject = edgeTest.neighbor as AnyObject
        if !(testVertex is Vertex) {
            XCTFail("edge vertex not intialized..")
        }
        
    }


    func testPath() {
        
        var pathTest: Path = Path()
        
        XCTAssertNotNil(pathTest, "instance not initialized..")
        XCTAssertNil(pathTest.previous, "path previous property not initialized..")
        XCTAssertNil(pathTest.total, "path total property not initialized..")
        
        var testVertex: AnyObject = pathTest.destination as AnyObject
        if !(testVertex is Vertex) {
            XCTFail("destination vertex not intialized..")
        }
        
    }

    
    func testAVLTree() {
        
        var testTree: AVLTree<Int> = AVLTree<Int>()
        
        XCTAssertNotNil(testTree, "instance not initialized..")
        XCTAssertNil(testTree.key, "key property not initialized..")
        XCTAssertNil(testTree.left, "left property not initialized..")
        XCTAssertNil(testTree.right, "right property not initialized..")
        
    }

    
}
