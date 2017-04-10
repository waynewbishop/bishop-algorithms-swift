//
//  MinStack.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 4/8/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation


class MinStack {
    
    
    //establish stack containers
    private var top: TestNode
    private var minimum: TestNode
    
    
    init() {
        top = TestNode()
        minimum = TestNode()
    }
    
    
    //retreive the minimum value - O(1)
    var min: Int {
      return minimum.key
    }
    
    
    //add items to the stack - O(1)
    func push(withKey key: Int) {

        
        //return trivial case
        guard top.key != nil else {
            top.key = key
            minimum = top
            return
        }
        
        
        //create new item
        let childToUse = TestNode()
        childToUse.key = key
        
        
        //set new created item at top
        childToUse.next = top
        top = childToUse
        
        
        //determine the minimum
        if top.key < minimum.key {
            minimum = top
        }
        
    }
    
    
    //remove item from the stack - O(1)
    func pop() {
        
        if top.next != nil {
            top = top.next

            //determine the minimum
            if top.key < minimum.key {
                minimum = top
            }
        }
            
        else {
            top.key = nil
        }
        
    }
    
    
    //retrieve the top most item - O(1)
    func peek() -> TestNode {
        return top
    }
    
}
