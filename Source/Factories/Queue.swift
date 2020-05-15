//
//  Queue.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/11/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Queue<T> {
        
    var top = Node<T>()
    private var counter: Int = 0

    
    var count: Int {
        return counter
    }

    
    func peek() -> T? {
        return top.tvalue
    }
    
    
    
    //check for a value
    func isEmpty() -> Bool {
        
        guard top.tvalue != nil else {
            return true
        }
        
        return false
    }


    
    //MARK: Queuing Functions

    
    //enqueue specified item - O(n)
    func enQueue(_ key: T) {
        
        
        //trivial case
        guard top.tvalue != nil else {
            top.tvalue = key
            counter += 1
            return
        }
        
        let childToUse = Node<T>()
        var current = top

        
        //find next position - O(n)
        while let next = current.next {
            current = next
        }
        
        
        //append new item
        childToUse.tvalue = key
        current.next = childToUse
        counter += 1
    }
    

    
    //retrieve top level item - O(1)
   func deQueue() -> T? {
    
    
        //trivial case
        guard top.tvalue != nil else {
            return nil
        }
    
        
        //retrieve current item
        let item = top.tvalue
    
    
        //queue next item
        if let next = top.next {
          top = next
          counter -= 1
        }
    
        else {
          top.tvalue = nil
          counter = 0
        }
    
    
        return item
    
    }
    
    
    
} //end class
