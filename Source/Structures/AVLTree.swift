//
//  AVLNode.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/26/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class AVLTree<T: Comparable> {
    
   var key: T? = nil
   var left: AVLTree? = nil
   var right: AVLTree? = nil
    
    
   private func printcode(object: T) {
        println("..the value is: \(object)")
    }
    

    //function to add item based on its value
    func addNode(key: T) {
        
        //check for the head node
        if (self.key == nil) {
            self.key = key
            
            printcode(key)
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
                printcode(key)
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
                printcode(key)
            }
            
        } //end if

        
    } //end function
    

} //end class