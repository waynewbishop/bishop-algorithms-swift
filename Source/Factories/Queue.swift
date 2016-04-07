//
//  Queue.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/11/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation

public class Queue<T> {
   
    private var top: QNode<T>!
    
    
    init() {
      top = QNode<T>()
    }
    
    
    
    //the number of items
    var count: Int {
        
        
        if (top.key == nil) {
            return 0
        }
            
        else  {
            
            var current: QNode<T> = top
            var x: Int = 1
            
            
            //cycle through the list of items
            while (current.next != nil) {
                current = current.next
                x += 1
            }
            
            return x
            
            }
    }


    //MARK: Supporting Functions
    
    
    
    //retrieve the top most item
    func peek() -> T! {
        return top.key
    }
    
    
    
    //check for the presence of a value
    func isEmpty() -> Bool {
        
        guard top.key != nil else {
            return true
        }
        
        return false
        
    }


    
    //MARK: Queuing Functions

    
    //enqueue the specified object
    func enQueue(key: T) {
        
        
        //check top node
        if (top.key == nil) {
            top.key = key
            return
        }
        
        let childToUse: QNode<T> = QNode<T>()
        var current: QNode<T> = top
    
        
        //cycle through the list
        while (current.next != nil) {
            current = current.next
        }
                
        
        //append a new item
        childToUse.key = key
        current.next = childToUse
        
    }
    

    
    //retrieve items from the top level - O(1) time
   func deQueue() -> T? {
    
    
        //determine key instance
        guard top.key != nil else {
            return nil
        }
    
    
        //retrieve and queue the next item
        let queueitem: T? = top.key
    
    
        //use optional binding 
        if let nextitem = top.next {
          top = nextitem
        }
        else {
            top = QNode<T>()
        }
    
    
        return queueitem
        
    }
    
    
    
} //end class




