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
    
    
    //enqueue the specified object
    func enQueue(key: T) {

        
        //check for the instance
        if (top == nil) {
            top = QNode<T>()
        }
        
        
        //establish the top node
        if (top.key == nil) {
            top.key = key;
            return
        }
        
        var childToUse: QNode<T> = QNode<T>()
        var current: QNode = top
    
        
        //cycle through the list of items to get to the end.
        while (current.next != nil) {
            current = current.next!
        }
                
        
        //append a new item
        childToUse.key = key;
        current.next = childToUse;
        
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
        var queueitem: T? = top.key!

    
        //use optional binding 
        if let nextitem = top.next {
          top = nextitem
        }
        else {
            top = nil
        }
    
    
        return queueitem
        
    }
    

    
   //check for the presence of a value
   func isEmpty() -> Bool {
    
        //determine if the key or instance exist
        if let topitem: T = self.top?.key {
            return false
        }
    
        else {
            return true
        }
    
    }
    
    
    
    //determine the count of the queue
    func count() -> Int {
        
        var x: Int = 0
        
        
        //determine if the key or instance exist
        let topitem: T? = self.top?.key
        
        if (topitem == nil) {
            return 0
        }
        
        
        var current: QNode = top
        
        x++
        
        //cycle through the list of items to get to the end.
        while (current.next != nil) {
            current = current.next!;
            x++
        }
        
        return x
        
    }
    
    
} //end class




