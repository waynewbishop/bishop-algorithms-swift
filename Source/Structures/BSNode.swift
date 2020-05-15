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
    
    var tvalue: T?
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
        
        
        let bsQueue = Queue<BSNode<T>>()
        
        //queue a starting node
        bsQueue.enQueue(self)
        
        
        while bsQueue.peek() != nil {
            
            //traverse the next queued node
            if let bitem = bsQueue.deQueue() {
                
                
                if let key = bitem.tvalue {
                    print("now traversing item: \(key)")
                }
                
                
                //check left decendant
                if let left = bitem.left {
                    bsQueue.enQueue(left)
                }
                
                
                //check right decendant
                if let right = bitem.right {
                    bsQueue.enQueue(right)
                }
                
            }
            

            
        } //end while
        
        print("bfs traversal complete..")
        
    }
    
    
    //regular dfs traversal
    func DFSTraverse() {
        
        //trivial condition
        guard let key = self.tvalue else {
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
        guard self.tvalue != nil else {
            print("no key provided..")
            return
        }
        
        
        //process the left side
        if self.left != nil {
            left?.DFSTraverse(withFormula: formula)
        }
        
        
        //invoke formula - apply results
        let newKey: T = formula(self)
        self.tvalue! = newKey
        
        
        print("...the updated value is: \(self.tvalue!) - height: \(self.height)..")
        
        
        //process the right side
        if self.right != nil {
            right?.DFSTraverse(withFormula: formula)
        }
        
    }
    
}
