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
        numberList = [8, 2, 10, 9, 7, 5]
    }
    
    
    /*
    notes: This test class mimics the basic functionality of adding and removing stack items.
    The "times" closure expression used is a custom implementation and is not part
    of the core library.
    */
    

    func testPopStack() {
        
        let myStack: Stack<Int>! = self.buildStack()
        
        if myStack.count == 0 || myStack == nil {
            XCTFail("test failed: no stack items available..")
        }

        
        //remove stack items..
        myStack.count.times { (s: Int) -> Void in
            print("stack count: \(myStack.count)")
            myStack.pop()
        }

        
        XCTAssertTrue(myStack.isEmpty(), "test failed: stack structured not emptied..")
        
        
    }
    
    
    //MARK: helper methods

    
    func buildStack() -> Stack<Int>! {
        
        let newStack: Stack<Int>! = Stack<Int>()
        XCTAssertNotNil(newStack, "test failed: instance not initialized..")
        
        
        //build stack
        for s in numberList {
            newStack.push(s)
            print("item: \(s) added..")
        }
        

        print("stack count is: \(newStack.count)")
        
        
        if newStack.count != numberList.count {
            return nil
        }
        else {
            return newStack
        }

        
    }
    
    

}
