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

    var hashTable: HashTable = HashTable()
    
    
    override func setUp() {
        super.setUp()
    }
    
    
    func testCreateHash() {
        hashTable.createHash("Dog")
    }

}
