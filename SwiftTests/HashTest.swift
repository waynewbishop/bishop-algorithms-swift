//
//  HashTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/29/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

class HashTest: XCTestCase {
    
    var listsize: Int!
    var swiftTable: HashTable!

    
    override func setUp() {
        super.setUp()
        
        listsize = 25
        swiftTable = HashTable(capacity: listsize)
    }

    
    //test the hash algorithm - add your own value to test
    func testCreateHash() {
        
        var hashValue: Int!
        hashValue = swiftTable.createHash("Dog")
        XCTAssertNotNil(hashValue, "test failed: no hash value detected..")
        
        if (hashValue != nil) {
            println("the computed hash value is: \(hashValue)..")
        }
        
    }
    

    //test the addition of words to the hash table
    func testAddWord() {
        swiftTable.addWord("Wayne", lastname: "Bishop")
        swiftTable.addWord("Wayne", lastname: "Bishop")
    }
    

}
