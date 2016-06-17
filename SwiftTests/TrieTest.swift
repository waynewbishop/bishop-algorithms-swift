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
    
    var testTrie: Trie = Trie()

    
    override func setUp() {
        super.setUp()
        
        XCTAssertNotNil(testTrie, "Trie instance not correctly intialized..")
    
        
        //add words to data structure
        testTrie.addWord("Ball")
        testTrie.addWord("Balls")
        testTrie.addWord("Ballard")
        testTrie.addWord("Bat")
        testTrie.addWord("Bar")
        testTrie.addWord("Cat")
    }
    
    

    /*
    the findWord algorithm will only return strings identified as words. For example, the prefix "Ba" has 3 children,
    but only 2 are marked as final. Even though the phrase "Bal" is found in the trie, it is not
    identified as a word.
    */

    func testPrintAllWords() {
        let wordList = testTrie.fetchAllWords()
        print("All Words:")
        for (index, word) in  wordList.enumerate() {
            print("\(index + 1) : \(word)")
        }
    }
    
    func testFindWithPrefix() {
        let prefix = "Ba"
        let wordList: Array<String>! = testTrie.findWord(prefix)
        print("All Words with prefix : \(prefix)")
        if wordList != nil {
            for (index, word) in  wordList.enumerate() {
                print("\(index + 1) : \(word)")
            }
        }
    }

    
    
    /*
    the findWord algorthim will identify both parents and children identified as words
    */
    
    func testFindWithWord() {
        let word = "Ball"
        let wordList: Array<String>! = testTrie.findWord(word)
        if wordList != nil {
            print("Word: \(word) exists.")
        } else {
            print("Word: \(word) doesn't exists.")
        }
    }
    
    
    //testing false search results
    func testFindNoExist() {
        
        let keyword: String = "Barstool"
        let wordList: Array<String>! = testTrie.findWord(keyword)
        
        if wordList != nil {
            print("Word: \(keyword) exists.")
        } else {
            print("Word: \(keyword) doesn't exists.")
        }
        
    } //end function
    

}
