//
//  ClosureTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/1/15.
//  Copyright (c) 2015 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

class ClosureTest: XCTestCase {

    var numberList: Array<Int>!

    
    override func setUp() {
        super.setUp()
        numberList =  [8, 5, 2, 10, 9, 7]
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
        
        var linkedList: LinkedList<Int> = self.buildLinkedList()
        
        
        //inline closure expression
        var results: LinkedList<Int>! = linkedList.filter { (node: LLNode<Int>) -> Bool in
            return node.key > 5
        }
        
        //display filtered results
        results.printAllKeys()
        
        if results.count == linkedList.count {
            XCTFail("linked list not filtered..")
        }
        
        
    }
    
    
    //filter based on function
    func testLinkFilterFunction() {
        
        var linkedList: LinkedList<Int> = self.buildLinkedList()

        //pass formula as parameter
        var results: LinkedList<Int>! = linkedList.filter(filterFormula)
        
        //print results
        results.printAllKeys()
        
        if results.count == linkedList.count {
            XCTFail("linked list not filtered..")
        }
        
        
    }


    
    //MARK: map closures

    
    //map based on expression
    func testLinkMapExpression() {

        var linkedList: LinkedList<Int> = self.buildLinkedList()
        
        //inline closure expression
        let results: LinkedList<Int> = linkedList.map { (node: LLNode<Int>) -> Int in

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
        results.printAllKeys()

        
        //iterate and compare values
        for s in 0..<numberList.count {
            if linkedList.linkAtIndex(s).key == results.linkAtIndex(s).key {
                XCTFail("linked list map formula not applied..")
            }
        }
        
        
    }
    

    //map based on function
    func testLinkMapFunction() {
        
        var linkedList: LinkedList<Int> = self.buildLinkedList()
        
        //pass formula as parameter
        var results: LinkedList<Int>! = linkedList.map(mapFormula)
        
        //print results
        results.printAllKeys()

        
        //iterate and compare values
        for s in 0..<numberList.count {
            if linkedList.linkAtIndex(s).key == results.linkAtIndex(s).key {
                XCTFail("linked list map formula not applied..")
            }
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
    func buildLinkedList() ->LinkedList<Int>! {
        
        
        //create a new instance
        var linkedList: LinkedList<Int> = LinkedList<Int>()
        
        
        //append list items
        for number in numberList {
            linkedList.addLink(number)
        }
        
        
        if (linkedList.count != numberList.count) {
            XCTFail("linked list count doesn't match number list..")
            return nil
        }
        
        return linkedList
        
        
    }

    

}
