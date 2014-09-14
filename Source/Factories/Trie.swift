//
//  Trie.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/18/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class SwiftTrie {
    
    var key: String!
    var children: Array<SwiftTrie>
    var isFinal: Bool
    var level: Int

    
    init() {
        self.key = nil
        self.children = Array<SwiftTrie>()
        self.isFinal = false
        self.level = 0
    }

    
    //returns all content based on the prefix
    func processPrefix(keyword: String) {
        
    }
    

    ///builds a recursive tree of dictionary content
    func addWord(keyWord: String) {
        
        
        if (keyWord.length == 0){
            return;
        }
        
        
        //check for base case
        if (keyWord.length == self.level) {
            self.isFinal = true
            println("end of word reached!")
            return;
        }
        

        var childToUse: SwiftTrie! = nil
        var searchKey: String = keyWord.substringToIndex(self.level + 1)
        
        //iterate through the node children
        for child in children {
            if (child.key == searchKey) {
                childToUse = child
                break
            }
        }
        
            
        //create a new node
        if  (childToUse == nil) {
            
            childToUse = SwiftTrie()

            childToUse.key = searchKey
            childToUse.level = self.level + 1;
            self.children.append(childToUse)
            
        }
        
        
        //add the remaining characters
        childToUse.addWord(keyWord)

        
    } //end function
    
    
}


