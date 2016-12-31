//
//  ClosureTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/1/15.
//  Copyright (c) 2015 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

@testable import SwiftStructures


class ClosureTest: XCTestCase {

    let numberList = [8, 5, 2, 10, 9, 7]
    
    override func setUp() {
        super.setUp()
    }
    
    
    /*
    notes: This test class mimics the map & filter array
    functions found in the Swift standard library. Optimized for linked lists, each test
    demonstrates the nessesary syntax to implement a closure as an inline expression or standard function.
    See additional closure examples with GraphTest.swift and AVLTest.swift.
    */
    
    
    //MARK: filter closures
    
    
    //filter based on expression
    func testLinkFilterExpression() {
        
        let linkedList = buildLinkedList()
        
        
        //inline closure expression
        guard let results = linkedList.filter({ node in
            return node.key > 5
        }) else { return }
        
        //display filtered results
        results.printAllKeys()
        
        XCTAssert(results.count != linkedList.count, "linked list not filtered.")
    }
    
    
    //filter based on function
    func testLinkFilterFunction() {
        
        let linkedList = buildLinkedList()

        //pass formula as parameter
        guard let results = linkedList.filter(filterFormula) else { return }
        
        //print results
        results.printAllKeys()
        
        XCTAssert(results.count != linkedList.count, "linked list not filtered.")
    }


    
    //MARK: map closures

    
    //map based on expression
    func testLinkMapExpression() {

        let linkedList = buildLinkedList()
        
        //inline closure expression
        let results = linkedList.map { node in

            var value: Int!
            
            //evaluate based on switch
            switch node.key {
                case 0..<5:
                    value = node.key * 2
                case 5...10:
                    value = node.key * 3
                default:
                    value = node.key
            }
            
            return value
            
            
        } //end closure

        
        //print results
        results?.printAllKeys()

        
        //iterate and compare values
        for s in 0..<numberList.count {
            
            XCTAssert(linkedList.getElement(at: s)?.key != results?.getElement(at: s)?.key, "test failed: linked list map formula not applied..")
            
        }
        
        
    }
    


    
    
    

    //map based on function
    func testLinkMapFunction() {
        
        let linkedList = buildLinkedList()
        
        //pass formula as parameter
        let results: LinkedList<Int>! = linkedList.map(mapFormula)
        
        //print results
        results.printAllKeys()

        
        //iterate and compare values
        for s in 0..<numberList.count {
            
            XCTAssert(linkedList.getElement(at: s)?.key != results?.getElement(at: s)?.key, "test failed: linked list map formula not applied..")
            
        }
        
        
    }
    
    
    
    //MARK: helper functions
    
    
    //function to be passed as a parameter
    func filterFormula(node: LLNode<Int>) -> Bool {
        return node.key > 5
    }

    
    
    //function to be passed as a parameter
    func mapFormula(node: LLNode<Int>) -> Int {
        
        var value: Int!
        
        //evaluate based on switch
        switch node.key {
        case 0..<5:
            value = node.key * 2
        case 5...10:
            value = node.key * 3
        default:
            value = node.key
        }
        
        return value

        
    }
  
    
    //helper method to build list
    func buildLinkedList() -> LinkedList<Int> {
        
        let linkedList = LinkedList<Int>()
        
        
        //append items
        for number in numberList {
            linkedList.append(element: number)
        }
        
        
        linkedList.printAllKeys()
        
        
        XCTAssert(linkedList.count == numberList.count, "test failed: linked list count \(linkedList.count) doesn't match number list count \(numberList.count).")
        
        return linkedList
        
    }


}
