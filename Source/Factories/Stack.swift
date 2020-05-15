//
//  Stack.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/1/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Stack<T> {
    
    var top: Node<T>
    private var counter: Int = 0
    
    
    init() {
        top = Node<T>()
    }
    
    
    //the number of items - O(1)
    var count: Int {
        return counter
    }
    
    
    //add item to the stack - O(1)
    func push(withKey key: T) {
        
        
        //return trivial case
        guard top.key != nil else {
            top.key = key
            counter += 1
            return
        }
        
        
        //create new item
        let childToUse = Node<T>()
        childToUse.key = key
            
            
        //set new created item at top
        childToUse.next = top
        top = childToUse


        //set counter
        counter += 1
        
    }


//MARK: Pop functions

    
    //remove item from the stack - O(1)
    func popValue()-> Node<T>? {
        
        guard top.key != nil else {
            counter = 0
            return nil
        }

        
        //make assignment
        if let top = top.next {
            counter -= 1
            return top
        }
        
        else {
            top.key = nil
            counter = 0
            return nil
        }
            
    }
    
    
    //remove item from the stack - O(1)
    func pop() {
        
        if top.key == nil {
            counter = 0
        }
            
        //make reassignment
        if let element = top.next {
            top = element
            counter -= 1
        }
            
        else {
            top.key = nil
            counter = 0
        }
            
    }
    
    
    func popValue() ->T? {
        
        
        guard let results = top.key else {
            counter = 0
            return nil
        }
        
            
        //make reassignment
        if let element = top.next {
            top = element
            counter -= 1
        }
        
        return results
            
    }


//MARK: Other functions
    
    
    //retrieve the top most item - O(1)
    func peek() -> Node<T> {
        return top
    }

    
    
    //check for value - O(1)
    func isEmpty() -> Bool {
        
        if self.count == 0 {
            return true
        }
        
        else {
            return false
        }
        
    }
}
