//
//  LearningTest.swift
//  SwiftTests
//
//  Created by Wayne Bishop on 10/22/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class LearningTest: XCTestCase {

    override func setUp() {
      super.setUp()
    }

    
    //establish a positive test
    func testAEClassifierAccurate() {
     
        let statement = "Our solar system has eight planets"
        
        XCTAssertTrue(self.buildAELearningModel(with: statement), "Accurate statement not identified by AEClassifier..")
    }

    
    //establish a negative test
    func testAEClassifierExaggeration() {
        
        let statement = "It always rains in Seattle"
        
        XCTAssertTrue(self.buildAELearningModel(with: statement), "Exaggerated statement not identitied by AEClassifier..")
    }

    
    
    //helper function - build machine learning model
    func buildAELearningModel(with predicition: String) -> Bool {

        //create a new learning instance using AEClassifier
        let learning = Learning()
        return learning.AEPredict(using: predicition)
    }
}
