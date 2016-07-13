//
//  ListTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/6/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class ListTest: XCTestCase {
    

    override func setUp() {
        super.setUp()
    }
    
    
    //test a string list
    func testStringList() {
        
        
        /*
         note: each element has its own corresponding "slot" in the
         hash list with the exception of hash "collisions".
         */

        
        //create new list
        let slist = HashList<String>(capacity: 25)
        
        
        _ = slist.append("Wayne Bishop", withKey: "Wayne")
        _ = slist.append("Frank Smith", withKey: "Frank")
        _ = slist.append("Jennifer Hobbs", withKey: "Jennifer")
        _ = slist.append("Tim Cook", withKey: "Tim")
        _ = slist.append("Steve Jobs", withKey: "Steve")
        _ = slist.append("Wayne Bishop", withKey: "Wayne")
        _ = slist.append("Larry Page", withKey: "Larry")
        _ = slist.append("Albert Einstien", withKey: "Albert")
        
        
        //TODO: Add additional tests for retrieving..
        
    }
    

    
    //test a vertex list
    func testVertexList() {
        
        let testVertex: Vertex = Vertex()
        testVertex.key = "A"
        
        let vList: HashList = HashList<Vertex>(capacity: 10)
       _ = vList.append(testVertex, withKey: testVertex.key!)
        
        
        //TODO: Add additional tests for retrieving..
        
    }
    
    
}
