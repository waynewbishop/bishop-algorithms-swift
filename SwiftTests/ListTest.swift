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
    
    
    //create new list
    let list = HashList<String>(capacity: 25)
    
    

    override func setUp() {
        super.setUp()
    }
    
    
    func testAppendList() {
        
         /*
         note: the addition of each word should have its own corresponding "slot" in the
         hash table with the exception of hash collisions.
         */
        
        self.buildHashList(withElement: "Wayne Bishop")
        self.buildHashList(withElement: "Frank Smith")
        self.buildHashList(withElement: "Jennifer Hobbs")
        self.buildHashList(withElement: "Tim Cook")
        self.buildHashList(withElement: "Steve Jobs")
        self.buildHashList(withElement: "Wayne Bishop") //duplicate value - collision
        self.buildHashList(withElement: "Larry Page")
        self.buildHashList(withElement: "Albert Einstein")
    }
    
    
    
    //example of unsupported list type
    func testAppendNoType() {
        
        let boolList = HashList<Bool>(capacity: 5)
        XCTAssertNotEqual(boolList.append(true), HashResults.Success, "append process succeeded incorrectly..")
    }
    
    
    
    
    //MARK: Helper Function
    
    
    //build and test
    func buildHashList(withElement element: String) {
        
        XCTAssertEqual(list.append(element), HashResults.Success, "append process failed..")
    }
    
    
}
