//
//  Queue.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/11/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation

public class Queue<T> {
   
    private var top: QNode<T>! = QNode<T>()
    
    
    //the number of items
    var count: Int {
        
        //set count equal to 0
        var count: Int = 0
    
        if (top.key != nil) { //if there are nodes, count them
            
            var current: QNode<T> = top
            count++ //Add one for the top
            
            //cycle through the list of items
            while (current.next != nil) {
                current = current.next!
                count++
            }
        }
        
        return count //return the count
    }

    
    
    //enqueue the specified object
    func enQueue(key: T) {
        
        
        //check for the instance
        if (top == nil) {
            top = QNode<T>()
        }
        
        
        //establish the top node
        if (top.key == nil) {
            top.key = key
            return
        }
        
        let childToUse: QNode<T> = QNode<T>()
        var current: QNode = top
    
        
        //cycle through the list of items to get to the end.
        while (current.next != nil) {
            current = current.next!
        }
                
        
        //append a new item
        childToUse.key = key
        current.next = childToUse
        
    }
    
    
    //retrieve the top most item
    func peek() -> T? {
        return top.key!
    }
    
    
    //retrieve items from the top level in O(1) constant time
    func deQueue() -> T? {
    
    
        //determine if the key or instance exist
        let topitem: T? = self.top?.key
    
        if (topitem == nil) {
            return nil
        }
    
        //retrieve and queue the next item
        let queueitem: T? = top.key!

    
        //use optional binding 
        if let nextitem = top.next {
          top = nextitem
        }
        else {
            top = QNode<T>()
        }
    
        return queueitem
        
    }
    
    
    //check for the presence of a value
    func isEmpty() -> Bool {
        
        //If count is 0, return true.
        return self.count == 0 ? true : false
    }
    
    
    
    
    
} //end class




