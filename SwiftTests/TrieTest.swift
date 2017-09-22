//
//  TrieTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/14/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

@testable import SwiftStructures


class TrieTest: XCTestCase {
    
    var testTrie = Trie()

    
    override func setUp() {
        super.setUp()
        
        XCTAssertNotNil(testTrie, "Trie instance not correctly intialized..")
                
        //add words to data structure
        testTrie.append(word: "Ball")
        testTrie.append(word: "Balls")
        testTrie.append(word: "Ballard")
        testTrie.append(word: "Bat")
        testTrie.append(word: "Bar")
    }
    
    

    /*
    the findWord algorithm will only return strings identified as words. For example, the prefix "Ba" has children,
    but only 2 are marked as final. Even though the phrase "Bal" is found in the trie, it is not
    identified as a word.
    */

    func testFindWithPrefix() {
        
        guard let list = testTrie["Ba"] else {
            XCTFail("test failed: no words found..")
            return
        }
        
        for word in list {
            print("\(word) found in trie..")
        }
    }

    
    
 
    //note: the findWord algorthim will identify both parents and children identified as words
 
    func testFindWithWord() {
        
        guard let list = testTrie["Ball"] else {
            XCTFail("test failed: no words found")
            return
        }
        
        for word in list {
            print("\(word) found in trie..")
        }
        
    }
    
    
    //testing false search results
    func testFindNoExist() {
        
        let keyword = "Barstool"
        
        //attempt to find word
        guard let _ = testTrie[keyword] else {
            return
        }
        
        XCTFail("test failed: \(keyword) incorrectly found in trie..")
    }
    

}
