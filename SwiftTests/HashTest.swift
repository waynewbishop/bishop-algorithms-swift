//
//  HashTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/29/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

@testable import SwiftStructures


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
    
    
    //find the word in the hash table
    func testFindWord() {
        
        swiftTable.findWord("Frank", lastname: "Smith") //found in hash table
        swiftTable.findWord("John", lastname: "Cervello") //not found (no collision)
        swiftTable.findWord("Andrew", lastname: "Collins") //not found in hash table (collision detected)
    }

    
    
    //test the hash algorithm - add your own value to test
    func testCreateHash() {
        
        var hashValue: Int!
        hashValue = swiftTable.createHash("Dog")
        XCTAssertNotNil(hashValue, "test failed: no hash value detected..")
        
        
        if (hashValue != nil) {
            print("the computed hash value is: \(hashValue)..")
        }

        
    } //end function
    

}
