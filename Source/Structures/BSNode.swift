//
//  BSNode.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/16/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation


//generic node to be used with binary search trees (BST's)

class BSNode<T>{
    
    var key: T?
    var left: BSNode?
    var right: BSNode?
    var height: Int
    
    init() {
        self.height = -1
    }
    
    
    var count: Int {
        let left = self.left?.count ?? 0
        let right = self.right?.count ?? 0
        return left + 1 + right
    }

    
//MARK: Traversal Algorithms

    
    //execute breadth-first search
    func BFSTraverse() -> () {
        
        //establish a queue
        let bsQueue = Queue<BSNode<T>>()
        
        //queue a starting node
        bsQueue.enQueue(self)
        
        while !bsQueue.isEmpty() {
            
            //traverse the next queued node
            guard let bitem = bsQueue.deQueue() else {
                break
            }
            
            print("now traversing item: \(bitem.key!)")
            
            //add decendants to the queue
            if let left = bitem.left {
                bsQueue.enQueue(left)
            }
            
            if let right = bitem.right {
                bsQueue.enQueue(right)
            }

            
        } //end while
        
        print("bfs traversal complete..")
        
    }
    
    
    //regular dfs traversal
    func DFSTraverse() {
        
        //trivial condition
        guard let key = self.key else {
            print("no key provided..")
            return
        }
        
        //process the left side
        if self.left != nil {
            left?.DFSTraverse()
        }
        
        print("...the value is: \(key) - height: \(self.height)..")
        
        //process the right side
        if self.right != nil {
            right?.DFSTraverse()
        }
    }
    
    
    //use dfs with trailing closure to update all values
    func DFSTraverse(withFormula formula: (BSNode<T>) -> T) {
        
        
        //check for trivial condition
        guard self.key != nil else {
            print("no key provided..")
            return
        }
        
        
        //process the left side
        if self.left != nil {
            left?.DFSTraverse(withFormula: formula)
        }
        
        
        //invoke formula - apply results
        let newKey: T = formula(self)
        self.key! = newKey
        
        
        print("...the updated value is: \(self.key!) - height: \(self.height)..")
        
        
        //process the right side
        if self.right != nil {
            right?.DFSTraverse(withFormula: formula)
        }
        
    }
    
}
