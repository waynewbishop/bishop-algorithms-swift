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
     
        let statement = "The solar system has eight planets"
        
        guard let result: AEClassifierResult = self.buildAELearningModel(with: statement) else {
           print("test failed: no predicted value for AEClassifier..")
           XCTFail()
           return
        }
        
        
        if result != "accurate" {
            print("accurate statement not identified by AEClassifier..")
            XCTFail()
            return
        }
        
        
    }

    
    //establish a negative test
    func testAEClassifierExaggeration() {
        
        let statement = "It always rains in Seattle"
        
        guard let result: AEClassifierResult = self.buildAELearningModel(with: statement) else {
            print("test failed: no predicted value for AEClassifier..")
            XCTFail()
            return
        }
        
        
        if result != "exaggeration" {
            print("exaggerated statement not identified by AEClassifier..")
            XCTFail()
            return
        }
        
    }
    
    
    
    
    //helper function - build machine learning model
    func buildAELearningModel(with prediction: String) -> AEClassifierResult? {

        //create a new learning instance using AEClassifier
        let learning = Learning()
        let results = learning.AEPredict(using: prediction)
        
        return results
    }
}
