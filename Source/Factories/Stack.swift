//
//  Stack.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/1/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Stack<T> {
    
    private var top: Node<T>
    
    init() {
        top = Node<T>()
    }
    
    
    //the number of items - O(n)
    var count: Int {
        
        
        //return trivial case
        guard top.key != nil else {
          return 0
        }
                
        
        var current = top
        var x: Int = 1
        
        
        //cycle through list
        while current.next != nil {
            current = current.next!
            x += 1
        }
            
        return x        
        
    }
    
    
    //add item to the stack
    func push(withKey key: T) {
        
        
        //return trivial case
        guard top.key != nil else {
            top.key = key
            return
        }
        
        
        //create new item
        let childToUse = Node<T>()
        childToUse.key = key
            
            
        //set new created item at top
        childToUse.next = top
        top = childToUse        

    }
    

    //remove item from the stack
    func pop() {
        
        if self.count > 1 {
            top = top.next
        }
        else {
            top.key = nil
        }
        
    }
    
    
    //retrieve the top most item
    func peek() -> T! {

        
        //determine instance
        if let topitem = top.key {
            return topitem
        }
            
        else {
            return nil
        }
        
    }
    
    
    
    //check for value
    func isEmpty() -> Bool {
        
        if self.count == 0 {
            return true
        }
        
        else {
            return false
        }
        
    }
    

}
