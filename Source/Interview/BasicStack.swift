//
//  BasicStack.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 4/8/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation


class BasicStack {
    
    
    //establish stack containers
    private var top: TestNode
    
    
    init() {
        top = TestNode()
    }
    
    
    //add items to the stack - O(1)
    func push(withKey key: Int) {
        
        
        //return trivial case
        guard top.key != nil else {
            top.key = key
            return
        }
        
        
        //create new item
        let childToUse = TestNode()
        childToUse.key = key
        
        
        //set new created item at top
        childToUse.next = top
        top = childToUse
        
    }
    
    
    //remove item from the stack - O(1)
    func pop() {
        
        if top.next != nil {
            top = top.next
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
