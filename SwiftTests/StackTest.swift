//
//  StackTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/1/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class StackTest: XCTestCase {

    var numberList: Array<Int> = [8, 2, 10, 9, 1, 5]
    
    
    override func setUp() {
        super.setUp()
    }
    
    
    //provides self-contained example of push function - essay example
    func testPushStack() {
        
        
        let tstack = Stack<Int>()
        XCTAssertTrue(tstack.count == 0, "test failed: count not initialized..")
        
        
        //build stack
        for s in numberList {
            tstack.push(s)
            print("item: \(s) added..")
        }

        XCTAssertTrue(tstack.count == numberList.count, "test failed: stack count does not match..")
    }
    
    

    func testPopStack() {
        
        
        //build stack - helper function
        let tstack: Stack<Int> = self.buildStack()
        
        
        if tstack.count == 0 {
           XCTFail("test failed: no stack items available..")
        }
        
        
        while tstack.count > 0 {
            if let item = tstack.peek() {
                print("poppped item: \(item). stack count: \(tstack.count)")
                tstack.pop()
            }
        }
        
 
        XCTAssertTrue(tstack.isEmpty(), "test failed: stack structured not emptied..")
                
    }
    
    

    //MARK: helper methods
    
    func buildStack() -> Stack<Int> {
        
        let newStack: Stack<Int> = Stack<Int>()
        XCTAssertTrue(newStack.count == 0, "test failed: count not initialized..")
        
        
        //build stack
        for s in numberList {
            newStack.push(s)
            print("item: \(s) added..")
        }
        
        
        print("stack count is: \(newStack.count)")
        
        
        return newStack
        
    }
    
    

}
