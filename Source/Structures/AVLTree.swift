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
            
            self.setNodeHeight()
            println("traversing left side. height of \(self.key!) is: \(self.height)...")
            
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
            
            
            self.setNodeHeight()
            println("traversing right side. height of \(self.key!) is: \(self.height)...")
            
            
        } //end if

        
    } //end function


    
    // MARK: - tree balancing algorithms
    
    
    //calculate the "height" of a node
    func setNodeHeight() -> Bool {
        
        var leftHeight: Int = 0
        var rightHeight: Int = 0
        var nodeHeight: Int = 0
 
        
        println("key: \(self.key!)")
        
        
        //check for a nil condition
        if (self.key == nil) {
            println("no key provided..")
            return false
        }
        
        
        //calculate left side
        if (self.left == nil) {
            leftHeight = 0
        }
        else {
            leftHeight = self.left!.height
            
        }
        
        //calculate right side
        if (self.right == nil) {
            rightHeight = 0
        }
        else {
            rightHeight = self.right!.height
        }
        
        
        //do comparision and set the height
        nodeHeight = max(leftHeight, rightHeight) + 1
        
        self.height = nodeHeight
        
        return true
        
    }


    
    //calculate if the tree is "balanced" - a balanced tree is O(log n)
    func isAVLBalanced() -> Bool! {
        
        //TODO: compare the height of the root node siblings.
        
        return nil;
    }
    

    
    // MARK: tree traversal algorithm
    
    
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