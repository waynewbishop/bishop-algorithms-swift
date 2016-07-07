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
    
    func testStringList() {
        
        //create new list
        let list = HashList<String>(capacity: 25)
        
        
        _ = list.append("Wayne Bishop")
        
        
        
    }
    
}
