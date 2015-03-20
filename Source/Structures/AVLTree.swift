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
        self.height = 0
    }
    
    
    //function to add item based on its value
    func addNode(key: T) {
        
        //check for the head node
        if (self.key == nil) {
            self.key = key
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
        var leftHeight: Int!
        var rightHeight: Int!

        
        leftHeight = self.left?.height
        rightHeight = self.right?.height

        
        //calculate left side
        if (leftHeight == nil) {
            leftHeight = 0
        }
        
        //calculate right side
        if (rightHeight == nil) {
            rightHeight = 0
        }
        
        
        //do comparision and calculate node height
        nodeHeight = max(leftHeight, rightHeight) + 1
        
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

        
        //initialize leaf variables
        var leftHeight: Int! = self.left?.height
        var rightHeight: Int! = self.right?.height
        var variance: Int
        
        
        //calculate left side
        if (leftHeight == nil) {
            leftHeight = 0
        }
        
        //calculate right side
        if (rightHeight == nil) {
            rightHeight = 0
        }
        
        //allow height variance of 1. This will allow for odd numbered sets
        if (leftHeight - rightHeight <= 1) {
            return true
        }
        else {
            return false
        }
        
        
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