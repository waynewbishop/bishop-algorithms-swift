//
//  AVLNode.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/26/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


/*
 note: self-balancing binary search tree
 when building the structure, items are positioned based on value.
*/


public class AVLTree<T: Comparable> {
    
    var key: T?
    var left: AVLTree?
    var right: AVLTree?
    var height: Int

    
    init() {
        self.height = -1
    }

    
    var count: Int {
        let left = self.left?.count ?? 0
        let right = self.right?.count ?? 0
        return left + 1 + right
    }
    

    
    //add item
    func addElement(withKey key: T) {
        
        
        guard self.key != nil else {
            self.key = key
            self.height = 0
            return
        }
        
        
        //check left side
        if key < self.key {
            
            
            if self.left != nil {
               left?.addElement(withKey: key)
            }
                
            
            else {
                let leftElement = AVLTree()
                leftElement.key = key
                leftElement.height = 0
                self.left = leftElement
            }
            
            _ = self.setNodeHeight()
            
            print("traversing left side. element \(self.key!) with height: \(self.height)...")
            
           _ = self.isValidAVLTree()
            
        }
       
        
        
        //check right side
        if key > self.key {
            
            
            if self.right != nil {
                right?.addElement(withKey: key)
            }
                
                
            else {
                let rightElement = AVLTree()
                rightElement.key = key
                rightElement.height = 0
                self.right = rightElement
            }
            
            _ = self.setNodeHeight()
            
            print("traversing right side. element \(self.key!) with height: \(self.height)...")
            
            _ = self.isValidAVLTree()
            
        }
        
        
        
    } //end function


    
    
    
    // MARK: - tree balancing algorithms

    
    
    //retrieve element height
    func getNodeHeight(_ aNode: AVLTree!) -> Int {
        
        if (aNode == nil) {
            return -1
        }
        else {
           return aNode.height
        }
        
    }
    
    
    
    //calculate the height of a node
    func setNodeHeight() -> Bool {
        
        
        //check for a nil condition
        if (self.key == nil) {
            print("no key provided..")
            return false
        }
        
        //println("key: \(self.key!)")
        

        //initialize leaf variables
        var nodeHeight: Int = 0
        
        
        //do comparision and calculate node height
        nodeHeight = max(getNodeHeight(self.left), getNodeHeight(self.right)) + 1
        
        self.height = nodeHeight
        
        return true
        
    }
    
    
    //determine if the tree is "balanced" - operations on a balanced tree is O(log n)
    func isTreeBalanced() -> Bool {

        
        //check for a nil condition
        if (self.key == nil) {
            print("no key provided..")
            return false
        }
        
        
        //use absolute value to manage right and left imbalances
        if (abs(getNodeHeight(self.left) - getNodeHeight(self.right)) <= 1) {
            return true
        }
        else {
            return false
        }
        
        
    } //end function

    

    
    //check to ensure node meets avl property
    func isValidAVLTree() -> Bool! {
        
        
        //check for valid scenario
        if (self.key == nil) {
            print("no key provided..")
            return false
        }
        
        
        if (self.isTreeBalanced() == true) {
            print("node \(self.key!) already balanced..")
            return true
        }
        
        //determine rotation type
        else {
            
            
            //create a new leaf node
            let childToUse : AVLTree = AVLTree()
            childToUse.height = 0
            childToUse.key = self.key
            
            
            if (getNodeHeight(self.left) - getNodeHeight(self.right) > 1) {
                
                print("\n starting right rotation on \(self.key!)..")
                
                
                //reset the root node
                self.key = self.left?.key
                self.height = getNodeHeight(self.left)

                
                //assign the new right node
                self.right = childToUse
                

                //adjust the left node
                self.left = self.left?.left
                self.left?.height = 0
                
                print("root is: \(self.key!) | left is : \(self.left!.key!) | right is : \(self.right!.key!)..")
                
                return true
                
            }

            
            if (getNodeHeight(self.right) - getNodeHeight(self.left) > 1) {
                
                print("\n starting left rotation on \(self.key!)..")
                
                //reset the root node
                self.key = self.right?.key
                self.height = getNodeHeight(self.right)
                
                
                //assign the new left node
                self.left = childToUse
                
                
                //adjust the right node
                self.right = self.right?.right
                self.right?.height = 0
                
                print("root is: \(self.key!) | left is : \(self.left!.key!) | right is : \(self.right!.key!)..")
                
                return true
                
            }
            
            
            return nil


            
        } //end if
        

        
    } //end function

    
    
    // MARK: traversal algorithms
    
    
    //use dfs with trailing closure to update all values
    func traverse(withFormula formula: (AVLTree<T>) -> T) {
        
        
        //check for trivial condition
        guard self.key != nil else {
            print("no key provided..")
            return
        }
        
        
        //process the left side
        if self.left != nil {
            left?.traverse(withFormula: formula)
        }
    
        
        //invoke formula - apply results
        let newKey: T = formula(self)
        self.key! = newKey
        

        print("...the updated value is: \(self.key!) - height: \(self.height)..")
        
        
        //process the right side
        if self.right != nil {
            right?.traverse(withFormula: formula)
        }
        
        
    }

    
    
    //regular dfs traversal
    func traverse() {


        //check for trivial condition
        guard self.key != nil else {
            print("no key provided..")
            return
        }
        
        //process the left side
        if self.left != nil {
            left?.traverse()
        }
        
        print("...the value is: \(self.key!) - height: \(self.height)..")
        

        //process the right side
        if self.right != nil {
            right?.traverse()
        }

        
    }
    

    

} //end class
