//
//  DelegateTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 5/16/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class DelegateTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
  
    }
  
    //test delegation design pattern
    func testDelegatePattern() {
        
        let example = Delegation()
        example.processContent(withElement: 5)
        
    }
    
}
