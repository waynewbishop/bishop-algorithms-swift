//
//  Trie.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/18/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class TrieNode {
        
    var key: String?
    var children: Array<TrieNode>
    var isFinal: Bool
    var level: Int

    
    init() {
        self.children = Array<TrieNode>()
        self.isFinal = false
        self.level = 0
    }

    
}


