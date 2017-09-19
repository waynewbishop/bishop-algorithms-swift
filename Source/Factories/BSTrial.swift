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
        
        
        //calculate height and balance of call stack..
        rebalance()
        
    }
    
    
    func traverse() {
        root.traverse()
    }
    
    
    //stack elements for later processing - memoization
    func push(element: inout BSNode<T>) {
        elementStack.push(withKey: element)
    }
    

    //determine height and balance
    func rebalance() {
        
        for _ in stride(from: elementStack.count, through: 1, by: -1) {
            
            //obtain generic stack node
            let current = elementStack.peek()
            let bsNode: BSNode<T> = current.key
            
            
            setHeight(element: bsNode)
            
            
            print("current node is \(String(describing: bsNode.key)) and stack count is \(elementStack.count)")
            elementStack.pop()
        }
    }
    
    
    
    //find element height
    func findHeight(of element: BSNode<T>?) -> Int {

        
        //check empty leaves
        guard let bsNode = element else {
            return -1
        }

        return bsNode.height
    }
    

    func setHeight(element: BSNode<T>) {
        
        //set leaf variables
        var elementHeight: Int = 0
        
        
        //do comparison and calculate height
        elementHeight = max(findHeight(of: element.left), findHeight(of: element.right)) + 1
        
        element.height = elementHeight
        
    }
    

  
    
}
