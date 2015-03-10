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
   
    init() {
        
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
                self.left = leftChild
            }
            
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
                self.right = rightChild
            }
            
        } //end if

        
    } //end function
    
    
    
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
        
        printKey(self.key!)
        
        
        //process the right side
        if (self.right != nil) {
            right?.processAVLDepthTraversal()
        }
        
        
    } //end function
    
    
    
    //helper function
    func printKey(value: T) {
        println("..the traversed value is: \(value)")
    }

    
    

} //end class