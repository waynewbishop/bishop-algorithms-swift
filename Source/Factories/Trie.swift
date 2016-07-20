//
//  Trie.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/14/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class Trie {
    
    private var root: TrieNode!
    
    
    init(){
        root = TrieNode()
    }
    
    
    
    //builds a tree hierarchy of dictionary content
    func append(word keyword: String) {
        
        
        //trivial case
        guard keyword.length > 0 else {
            return
        }
        
        
        var current: TrieNode = root
        
        
        while keyword.length != current.level {
            
            var childToUse: TrieNode!
            let searchKey = keyword.substring(to: current.level + 1)
            
            
            //print("current has \(current.children.count) children..")
            
            
            //iterate through child nodes
            for child in current.children {
                
                if (child.key == searchKey) {
                    childToUse = child
                    break
                }
                
            }
            
            
            //new node
            if childToUse == nil {
                
                childToUse = TrieNode()
                childToUse.key = searchKey
                childToUse.level = current.level + 1
                current.children.append(childToUse)
            }
            
            
            current = childToUse
            
            
        } //end while
        
        
        //final end of word check
        if (keyword.length == current.level) {
            current.isFinal = true
            print("end of word reached!")
            return
        }
        
        
        
    } //end function
    
    

    
    //find words based on the prefix
    func search(forWord keyword: String) -> Array<String>! {
        
        
        //trivial case
        guard keyword.length > 0 else {
            return nil
        }
        
        
        var current: TrieNode = root
        var wordList = Array<String>()
        
        
        while keyword.length != current.level {
            
            var childToUse: TrieNode!
            let searchKey = keyword.substring(to: current.level + 1)
            

            //print("looking for prefix: \(searchKey)..")
            
            
            //iterate through any child nodes
            for child in current.children {
                
                if (child.key == searchKey) {
                    childToUse = child
                    current = childToUse
                    break
                }
                
            }
            
 
            if childToUse == nil {
               return nil
            }
            
            
        } //end while
        
        
        
        //retrieve the keyword and any descendants
        if ((current.key == keyword) && (current.isFinal)) {
            wordList.append(current.key)
        }

        
        //include only children that are words
        for child in current.children {
            
            if (child.isFinal == true) {
                wordList.append(child.key)
            }
            
        }
        
        
        return wordList

        
    } //end function
    

}
