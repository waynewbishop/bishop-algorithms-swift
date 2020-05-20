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
    
    
    func testStrings() {
        
        //test string implementation
        let slist = HashSet<String>()
        
       _ = slist.insert("Wayne")
       _ = slist.insert("Bishop")    
       _ = slist.insert("is")
       _ = slist.insert("a")
       _ = slist.insert("loser")
       _ = slist.insert("winner")
        
       //test string list compliance
       XCTAssertTrue(slist.contains("Wayne"), "hash set element not found..")
        
    }

    
    
    func testIntegers() {
        
        //test integer implementation
        let slist = HashSet<Int>()
             
        _ = slist.insert(48)
        _ = slist.insert(22)
        _ = slist.insert(19)
        _ = slist.insert(4)
        _ = slist.insert(24)
        _ = slist.insert(99)
        
        //test int list compliance
        XCTAssertTrue(slist.contains(48), "hash set element not found..")
                
    }
    
        
    //test missing values
    func testMissingValues() {
        
        
        //new float list
        let mlist = HashSet<Int>()
        
        _ = mlist.insert(87)
        _ = mlist.insert(22)
        
        
        //element doesn't exist
        XCTAssertFalse(mlist.contains(45), "non-existent hash set element found..")
        
    }

    
}
