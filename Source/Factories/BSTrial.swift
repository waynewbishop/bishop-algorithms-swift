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
        
        
        //initialize root
        guard root.key != nil else {
            
            root.key = key
            root.height = 0
            
            return
        }
        
        
        //set initial indicator
        var current: BSNode = root

        
        while current.key != nil {

            //send reference of current item to stack
            push(element: &current)
            
            
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
        
      
        //TODO: run a function to pop all nodes from the stack and perform height and balance calculations..
        rebalance()
        
    }
    
    
    //stack visited elements for later processing
    func push(element: inout BSNode<T>) {
        elementStack.push(withKey: element)
    }
    
    
    //pop all nodes from the stack and perform height and balance calculations..
    func rebalance() {
        
        for _ in stride(from: elementStack.count, through: 1, by: -1) {

            
            //obtain generic stacked node
            let current = elementStack.peek()
            let bsNode: BSNode<T>! = current.key
            
            
            print("current node is \(String(describing: bsNode.key)) and stack count is \(elementStack.count)")
            elementStack.pop()
        }
    }
    
    
    

    func setHeight(element: inout BSNode<T>) {
    
    }
    
    
}
