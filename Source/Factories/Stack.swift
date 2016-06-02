//
//  Stack.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/1/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Stack<T> {
    
    private var top: Node<T>! = Node<T>()
    
    
    //the number of items
    var count: Int {
        
        
        //return trivial case
        guard top != nil else {
          return 0
        }
                
        
        var current: Node = top
        var x: Int = 1
        
        
        //cycle through list
        while current.next != nil {
            current = current.next!
            x += 1
        }
            
        return x        
        
    }
    
    
    //add item to the stack
    func push(key: T) {
        
        
        //check for instance
        if  top == nil {
            top = Node<T>()
        }
        
        
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
    func pop() -> T! {
     
        
        //return trivial case
        guard top != nil else {
            return nil
        }
        
        //retrieve next item
        let stackitem: T! = top.key
        
        
        //reset the top value
        if let nextitem = top.next {
            top = nextitem
        }
        else {
            top = nil
        }
        
        return stackitem

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