//
//  BSTree.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/26/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


/*
 note: self-balancing binary search tree (BST). Elements are positioned based on their value.
 After insertion, BST model is checked for balance and completes any required rotations.
*/


public class BSRecursive<T: Comparable> {
    
    
    var key: T?
    var left: BSRecursive?
    var right: BSRecursive?
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
    func append(element key: T) {
        
        
        //check root
        guard self.key != nil else {
            
            self.key = key
            self.height = 0
            return
        }
        
        
        //check left side
        if key < self.key! {
            
            
            if self.left != nil {
                left?.append(element: key)
            }
                
                
            else {
                
                //new element
                let leftElement = BSRecursive()
                leftElement.key = key
                leftElement.height = 0
                
                self.left = leftElement
            }
            
            _ = self.setHeight()
            
            print("traversing left side. element \(self.key!) with height: \(self.height)...")
            
           _ = self.rotate()
            
        }
               
        
        //check right side
        if key > self.key! {
            
            
            if self.right != nil {
                right?.append(element: key)
            }
                
                
            else {
                
                //new element
                let rightElement = BSRecursive()
                rightElement.key = key
                rightElement.height = 0
                
                self.right = rightElement
            }
            
            _ = self.setHeight()
            
            print("traversing right side. element \(self.key!) with height: \(self.height)...")
            
            _ = self.rotate()
            
        }
        
    }


    
    
    // MARK: - tree balancing algorithms

    
    //find element height
    func findHeight(of element: BSRecursive!) -> Int {
        
        guard element != nil else {
            return -1
        }
        
        return element.height
        
    }
    
    
    
    //calculate height
    func setHeight() -> Bool {

        
        //trivial case
        guard self.key != nil else {
            print("no key provided..")
            return false
        }
        
        
        //set leaf variables
        var elementHeight: Int = 0
        
        
        //do comparison and calculate height
        elementHeight = max(findHeight(of: self.left), findHeight(of: self.right)) + 1
        
        self.height = elementHeight
        
        return true
    }
    
    
    
    //determine if the tree is "balanced" - operations on a balanced tree is O(log n)
    func isTreeBalanced() -> Bool {

        
        guard self.key != nil else {
            print("no element provided..")
            return false
        }
        
        
        //use absolute value to manage right and left imbalances
        if (abs(findHeight(of: self.left) - findHeight(of: self.right)) <= 1) {
            return true
        }
        else {
            return false
        }
        
        
    }

    

    
    //rotate model - if required
    func rotate() -> Bool! {
        
        
        guard self.key != nil else {
            print("no element provided..")
            return false
        }
        
        
        if (self.isTreeBalanced() == true) {
            print("node \(self.key!) already balanced..")
            return true
        }
        
            
        //determine rotation type
        else {
            
            
            //new leaf node
            let childToUse : BSRecursive = BSRecursive()
            childToUse.height = 0
            childToUse.key = self.key
            
            
            if (findHeight(of: self.left) - findHeight(of: self.right) > 1) {
                
                print("\n starting right rotation on \(self.key!)..")
                
                
                //reset the root node
                self.key = self.left?.key
                self.height = findHeight(of: self.left)

                
                //assign the new right node
                self.right = childToUse
                

                //adjust the left node
                self.left = self.left?.left
                self.left?.height = 0
                
                print("root is: \(self.key!) | left is : \(self.left!.key!) | right is : \(self.right!.key!)..")
                
                return true
                
            }

            
            if (findHeight(of: self.right) - findHeight(of: self.left) > 1) {
                
                print("\n starting left rotation on \(self.key!)..")
                
                //reset the root node
                self.key = self.right?.key
                self.height = findHeight(of: self.right)
                
                
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
    func traverse(withFormula formula: (BSRecursive<T>) -> T) {
        
        
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
            print("\(String(describing: self.left?.key)) added to call stack..")
            left?.traverse()
        }
        
        print("...the value is: \(self.key!) - height: \(self.height)..")
        

        //process the right side
        if self.right != nil {
            print("\(String(describing: self.right?.key)) added to call stack..")
            right?.traverse()
        }

        
    }
    

    

} //end class
