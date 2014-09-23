//
//  AVLTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/23/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

class AVLTest: XCTestCase {
 
    
    let numberList : Array<Int> = [8, 2, 10, 9, 7, 5]
    
    
    //invoke in-order travesal algorithm
    func testAVLDepthTraversal() {
        
        //create a new instance
        var avlTest: AVLTree<Int> = AVLTree<Int>()
        XCTAssertNotNil(avlTest, "avl instance not created..")
        
        
        //build the list
        for number in numberList {
            avlTest.addNode(number)
        }
        
        //check on this in the output
        avlTest.processAVLDepthTraversal()
        
        
    } //end function
    
}
