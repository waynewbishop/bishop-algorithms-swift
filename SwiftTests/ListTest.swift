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
    
    
    //test strings
    func testStringList() {
        
        
        /*
         note: each element has its own potential 'slot' in the
         hash list. In this scenario, the hash table algorithm will
         implement 'separate chaining' to support 'hash collisions'.
         */

        
        //new string list
        let slist = HashList<String>(capacity: 3)
        
        
        _ = slist.append("Wayne Bishop")
        _ = slist.append("Frank Smith")
        _ = slist.append("Jennifer Hobbs")
        _ = slist.append("Tim Cook")
        _ = slist.append("Steve Jobs")
        _ = slist.append("Wayne Bishop") //should produce collision
        _ = slist.append("Larry Page")
        _ = slist.append("Albert Einstien")

        
        
        //obtain element
        let element = slist.getElement(with: "Frank Smith")
        
        if let results = element.0 {
            let rString: String? = results.element
            print("element with value: \(rString)")
        }
        
        else {
            XCTFail("value not retreived..")
        }
        
        
    }
    
    
    //test verticies - custom
    func testVertexList() {
        
        
        /*
         note: for this test, the added element is a custom object.
         using this technique, any potential object could be used.
        */

        
        let testVertex: Vertex = Vertex()
        testVertex.key = "A"
        
        let vList: HashList = HashList<Vertex>(capacity: 10)
       _ = vList.append(testVertex)

        
        
        //obtain element
        let element = vList.getElement(with: "A")
        
        if let results = element.0 {
            let rVertex: Vertex? = results.element
            print("element with key \(rVertex?.key)")
        }
        
        else {
            XCTFail("element not retreived..")
        }
        
    }
    
    
    //test floats
    func testMissingList() {
        
        
        //new float list
        let fList = HashList<Float>(capacity: 5)
        
        _ = fList.append(10.2)
        _ = fList.append(8.6)
        
        
        //element doesn't exist..
        let element = fList.getElement(with: String(3.7))
        
        if element.1 != HashResults.NotFound {
            XCTFail("element incorrectly found..")
        }        
        
    }
    
    
}
