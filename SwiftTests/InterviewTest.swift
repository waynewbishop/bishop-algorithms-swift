//
//  InterviewTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 4/5/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures

class InterviewTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    

    //MARK: String Uniqueness
    
    
    func testIsUniqueBall() {
    
        //establish string and evaluate results
        let keyword: String = "Ball"
        self.processIsUniqueResults(word: keyword)
    }

    
    func testIsUniqueElliott() {
        
        //establish string and evaluate results
        let keyword: String = "Elliott"
        self.processIsUniqueResults(word: keyword)
    }
    
    
    func testIsUniqueWayne() {
    
        //establish string and evaluate results
        let keyword: String = "Wayne"
        self.processIsUniqueResults(word: keyword)
    }
    
    
    //test uniqueness of the word
    func processIsUniqueResults(word keyword: String) {

        print("testing unique word: \(keyword)")
        
        let question: Interview = Interview()
        XCTAssertTrue(question.isStringUnique(word: keyword))
    }
}
