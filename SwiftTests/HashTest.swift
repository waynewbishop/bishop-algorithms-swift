//
//  ListTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/6/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class HashTest: XCTestCase {
    

    override func setUp() {
        super.setUp()
    }
    
    
    //test strings
    func testStringList() {
        
        
        /*
         note: each element has its own potential 'slot' in the
         hash list. In this scenario, the hash table algorithm will
         implement 'separate chaining' to support 'hash collisions'.
         */
        
        //new string list
        let slist = HashTable<String>(capacity: 3)
        
        
        _ = slist.append("Wayne Bishop")
        _ = slist.append("Frank Smith")
        _ = slist.append("Jennifer Hobbs")
        _ = slist.append("Tim Cook")
        _ = slist.append("Steve Jobs")
        _ = slist.append("Wayne Bishop") //should produce collision
        _ = slist.append("Larry Page")
        _ = slist.append("Albert Einstien")
        
        
        //test list compliance
        XCTAssertTrue(slist.contains("Frank Smith"), "hash table element not found..")
    }
    
    
    //test verticies - custom
    func testVertexList() {
        
        
        let testVertex: Vertex = Vertex()
        testVertex.key = "A"
        
        let vList: HashTable = HashTable<Vertex>(capacity: 10)
       _ = vList.append(testVertex)

        
        //test list compliance
        XCTAssertTrue(vList.contains("A"), "hash table element not found..")
    
    }
    
    
    //test floats
    func testMissingList() {
        
        
        //new float list
        let fList = HashTable<Double>(capacity: 5)
        
        _ = fList.append(10.2)
        _ = fList.append(8.6)
        
        //element doesn't exist
        XCTAssertFalse(fList.contains(3.7), "hash table element not found..")
        
    }
    
}
