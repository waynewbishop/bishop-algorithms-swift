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

    var numberList: Array<Int>!
    
    override func setUp() {
        super.setUp()
        
        numberList = [8, 2, 10, 9, 1, 5]
    }
    
    
    
    //provides self-contained example of push function - essay example
    func testPushStack() {
        
        
        let myStack = Stack<Int>()
        XCTAssertTrue(myStack.count == 0, "test failed: count not initialized..")
        
        
        //build stack
        for s in numberList {
            myStack.push(withKey: s)
            print("item: \(s) added..")
        }

        XCTAssertTrue(myStack.count == numberList.count, "test failed: stack count does not match..")
    }
    
    

    func testPopStack() {
        
        
        //build stack - helper function
        let myStack: Stack<Int> = self.buildStack()
        
        
        if myStack.count == 0 {
           XCTFail("test failed: no stack items available..")
        }

        
        for _ in stride(from: myStack.count, through: 0, by: -1) {
            print("stack item is: \(String(describing: myStack.peek().key)). stack count: \(myStack.count)")
            myStack.pop()
        }
        
 
        XCTAssertTrue(myStack.isEmpty(), "test failed: stack structured not emptied..")
                
    }
    
    

    //MARK: helper methods
    
    func buildStack() -> Stack<Int>! {
        
        let newStack: Stack<Int> = Stack<Int>()
        XCTAssertTrue(newStack.count == 0, "test failed: count not initialized..")
        
        
        //build stack
        for s in numberList {
            newStack.push(withKey: s)
            print("item: \(s) added..")
        }
        
        
        print("stack count is: \(newStack.count)")
        
        
        return newStack
        
    }
    
    

}
