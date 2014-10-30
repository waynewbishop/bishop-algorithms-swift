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
        
        
        /*
        note: unlike other collections, the table capacity of 25 does not limit the
        data structure to hold a limited number of items. This is due to the "separate chaining"
        algorithm technique.
        */
        
        
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
        
        
        /*
        note: the addition of each word should have its own corresponding "slot" in the
        hash table with the exception of the duplicate value. However, its important to see
        the collision is due to the "matched" computed hash value.
        */
        
        
        swiftTable.addWord("Wayne", lastname: "Bishop")
        swiftTable.addWord("Frank", lastname: "Smith")
        swiftTable.addWord("Jennifer", lastname: "Hobbs")
        swiftTable.addWord("Tim", lastname: "Cook")
        swiftTable.addWord("Steve", lastname: "Jobs")
        swiftTable.addWord("Wayne", lastname: "Bishop") //duplicate value - collision should occur
        swiftTable.addWord("Larry", lastname: "Page")
        swiftTable.addWord("Albert", lastname: "Einstein")
        
    }
    

}
