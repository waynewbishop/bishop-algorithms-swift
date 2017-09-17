//
//  BSTrial.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/16/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation


class BSTrial<T: Comparable>{
    
    var root = BSNode<T>()    
    var elementStack = Stack<BSNode<T>>()
    
    
    func append(element key: T) {
        
        
        //check root
        guard root.key != nil else {
            
            root.key = key
            root.height = 0
            
            return
        }
        
        
        //set initial indicator
        var current: BSNode = root

        
        while current.key != nil {

            //send reference of current item to stack
            stack(element: &current)
            
            
            //check left side
            if key < current.key! {
                
                if current.left != nil {
                    current = current.left!
                }
                    
                    
                else {
                    
                    //create new element
                    let childToAdd = BSNode<T>()
                    childToAdd.key = key
                    childToAdd.height = 0
                    current.left = childToAdd
                    break
                }
                
            }
            
        } //end while
        
        
        //TODO: Now cycle through the FILO stack update each node's height accordingly..
        
    }
    

    
    //stack visited elements for later processing
    func stack(element: inout BSNode<T>) {
        elementStack.push(withKey: element)
    }
    
    
}
