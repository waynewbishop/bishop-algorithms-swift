//
//  MathTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/29/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


private var math: Math = Math()


class MathTest: XCTestCase {

    override func setUp() {
        super.setUp()
        
    }
    
    
    //TODO: Revise this model so its similar to the AVL model..

    
    //published example
    func testFibonnaciEssayExample() {
        
        
        let positions: Int = 4
        let results: Array<Int>! = math.fib(positions)
        
        
        for s in results {
            print("value is:\(s)")
        }
        
        
    }

    
 
}
