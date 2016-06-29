//
//  QueueTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/5/15.
//  Copyright (c) 2015 Arbutus Software Inc. All rights reserved.
//

import XCTest
@testable import SwiftStructures


class QueueTest: XCTestCase {

    var numberList: Array<Int>!

    
    override func setUp() {
        super.setUp()
        numberList = [8, 2, 10, 9, 7, 5]
    }

    
    /*
    notes: This test class mimics the basic functionality of adding and removing queue items.
    The "times" closure expression used is a custom implementation and is not part
    of the core library.
    */
    
    
    //test the deQueueing process
    func testDeQueue() {
        
        let q: Queue<Int>! = buildQueue()
        
        XCTAssertNotNil(q, "queue instance not present..")
        
        
        //deQueue list items..
        numberList.count.times { (s: Int) -> Void in
            print("the queued item is \(q.peek() as Int!)")
            _ = q.deQueue()
        }

        
        //check for queued items
        XCTAssertTrue(q.count == 0, "deQueue process failed..")
        XCTAssertTrue(q.isEmpty(), "queue isEmpty() process failed..")
        
        
    }
    
    
    //MARK: helper methods
    
    func buildQueue() -> Queue<Int>! {
        
        let newq: Queue<Int>! = Queue<Int>()
        
        XCTAssertTrue(newq.count == 0, "new queue instance not created..")
        
        
        //build queue
        for s in numberList {
            newq.enQueue(s)
            print("count is: \(newq.count)")
        }
        
        

        //check equality
        if newq.count != numberList.count {
            XCTFail("queue build failed..")
        }
        
        return newq
        
    }
    
    

}
