//
//  SwiftFactory.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/7/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class LinkedList<T: Equatable> {
    
    
    //create a new LLNode instance 
    private var head: LLNode<T> = LLNode<T>()
    
    
    //the number of items
    var count: Int {
        
        
            if (head.key == nil) {
                return 0
            }
                
            else  {
                
                var current: LLNode = head
                var x: Int = 1
                
                
                //cycle through the list of items
                while ((current.next) != nil) {
                    current = current.next!;
                    x++
                }
                
                return x
                
            }
    }
    
    
    
    //append a new item to a linked list
    func addLink(key: T) {
        
        
        //establish the head node
        if (head.key == nil) {
            head.key = key;
            return;
        }
    
        
        //establish the iteration variables
        var current: LLNode? =  head
        
        
        while (current != nil) {
            
            if (current?.next == nil) {
                
                var childToUse: LLNode = LLNode<T>()
                
                childToUse.key = key;
                childToUse.previous = current
                current!.next = childToUse;
                break
            }
                
            else {
                current = current?.next
            }
            
            
        } //end while
        
    }
    
    
    //print all keys for the class
    func printAllKeys() {
        
        var current: LLNode! = head;
        
        println("------------------")
        
        //assign the next instance
        while (current != nil) {
            println("link item is: \(current.key)")
            current = current.next
        }
        
        
    }
    
    
    //remove a link at a specific index
    func removeLinkAtIndex(index: Int) {
        
        var current: LLNode<T>? =  head
        var trailer: LLNode<T>? = nil
        var listIndex: Int = 0
        
        
        //determine if the removal is at the head
        if (index == 0) {
            current = current?.next
            head = current!
            return
        }
        
        
        //iterate through the remaining items
        while (current != nil) {
            
            if (listIndex == index) {
                
                //redirect the trailer and next pointers
                trailer!.next = current?.next
                current = nil
                break;
                
            }
            
            //update the assignments
            trailer = current
            current = current?.next
            listIndex++
            
        } //end while
        
        
    } //end function
    
    
    
    //just testing optionals and value assignment
    func addLinkAtIndex(key: T, index: Int) {
        
        
        //establish the head node
        if (head.key == nil) {
            head.key = key;
            return;
        }
        
        //establish the trailer, current and new items
        var current: LLNode<T>? = head
        var trailer: LLNode<T>? = nil
        var listIndex: Int = 0
        
        
        //iterate through the list to find the insertion point
        while (current != nil) {
            
            if (index == listIndex) {
                
                var childToUse: LLNode = LLNode<T>()
                
                //create the new node
                childToUse.key = key;
                
                
                //connect the node infront of the current node
                childToUse.next = current
                childToUse.previous = trailer
                
                
                //use optional binding when using the trailer 
                if let linktrailer = trailer {
                    linktrailer.next = childToUse
                    childToUse.previous = linktrailer
                }
                
                
                //point new node to the current / previous
                current!.previous = childToUse
                
                
                //replace the head node if required
                if (index == 0) {
                    head = childToUse
                }
                
                
                break
                
            } //end if

            
            //iterate through to the next item
            trailer = current
            current = current?.next
            listIndex += 1
            
            
        } //end while
        
    }
  
  func reverseLinkedList() {
    //if count == 1 or count == 0,no need to reverse
    if count <= 1{
      return
    }
    
    var current : LLNode<T>? = head
    var next : LLNode<T>? = nil
    
    while(current != nil) {
      //reverse
      next = current!.next
      current!.next = current!.previous
      current!.previous = next
      
      
      if next == nil {
        head = current!
      } //end if
      
      //move to next node
      current = next
    } //end while
    
    
  }
  
    
} //end class






