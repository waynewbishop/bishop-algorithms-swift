//
//  AVLNode.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/26/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


/* An AVL Tree is another name for a balanced binary search tree*/

public class AVLTree<T: Comparable> {
    
    var key: T?
    var left: AVLTree?
    var right: AVLTree?
    var height: Int
   
    init() {
        //set math purposes
        self.height = -1
    }
    
    
    //function to add item based on its value
    func addNode(key: T) {
        
        //check for the root node
        if (self.key == nil) {
            self.key = key
            self.height = 0
            return
        }
        
        
        //check the left side of the tree
        if (key < self.key) {
            
            
            if (self.left != nil) {
                left?.addNode(key)
            }
                
            else {
                //create a new left node
                var leftChild : AVLTree = AVLTree()
                leftChild.key = key
                leftChild.height = 0
                self.left = leftChild
            }
            
            //recalculate the hierarchy after placing node
            self.setNodeHeight()
            println("traversing left side. height of \(self.key!) is: \(self.height)...")
            
            
            //TODO: check node balance and perform any required rotations..
            
            
        } //end if
       
        
        
        //check the left side of the tree
        if (key > self.key) {            
            
            if (self.right != nil) {
                right?.addNode(key)
            }
                
            else {
                //create a new right node
                var rightChild : AVLTree = AVLTree()
                rightChild.key = key
                rightChild.height = 0
                self.right = rightChild
                         
            }
            
            //recalculate the hierarchy after placing node
            self.setNodeHeight()
            println("traversing right side. height of \(self.key!) is: \(self.height)...")
            
            //TODO: check node balance and perform any required rotations..
            
            
        } //end if

        
    } //end function


    
    
    // MARK: - tree balancing algorithms

    
    //retrieve the height of a node
    func getNodeHeight(aNode: AVLTree!) -> Int {
        
        var nodeHeight: Int = 0
        
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
            println("no key provided..")
            return false
        }
        
        //println("key: \(self.key!)")
        

        //initialize leaf variables
        var nodeHeight: Int = 0
        
        
        //do comparision and calculate node height
        nodeHeight = max(self.getNodeHeight(self.left), self.getNodeHeight(self.right)) + 1
        
        self.height = nodeHeight
        
        return true
        
    }
    

    
    //determine if the tree is "balanced" - operations on a balanced tree is O(log n)
    func isTreeBalanced() -> Bool {

        
        //check for a nil condition
        if (self.key == nil) {
            println("no key provided..")
            return false
        }
        
        
        //use absolute value to account for right and left imbalances
        if (abs(self.getNodeHeight(self.left) - self.getNodeHeight(self.right)) <= 1) {
            return true
        }
        else {
            return false
        }
        
        
    } //end function

    

    
    //check to ensure node meets avl property
    func isValidAVLTree() -> Bool {
        
        
        //check for valid scenario
        if (self.key == nil) {
            println("no key provided..")
            return false
        }
        
        
        if (self.isTreeBalanced() == true) {
            println("node \(self.key) already balanced..")
            return true
        }
        
        //determine single-right or double rotation
        else {
            
            if (self.getNodeHeight(self.left) - self.getNodeHeight(self.right) <= 1) {
                println("performing right node rotation...")
                
                
                var childToUse : AVLTree = AVLTree()
                childToUse = self
                
                //2. assign the self pointer the left leaf..
                //3. add the pointer created in step 1 as the right node of the new self.
                
                
            }

            
            //double rotation
            if (self.getNodeHeight(self.right) - self.getNodeHeight(self.left) <= 1) {
                println("performing right node rotation...")
            }
            

            return true

            
        } //end if
        
        
    }

    
    
    // MARK: traversal algorithm
    
    
    //depth first search in-order traversal
    func processAVLDepthTraversal() {
        
        
        //check for a nil condition
        if (self.key == nil) {
            println("no key provided..")
            return
        }
        
        
        //process the left side
        if (self.left != nil) {
            left?.processAVLDepthTraversal()
        }
        
        println("..the traversed value is: \(self.key!). height: \(self.height)..")
        
        //process the right side
        if (self.right != nil) {
            right?.processAVLDepthTraversal()
        }
        
        
    } //end function


    

} //end class