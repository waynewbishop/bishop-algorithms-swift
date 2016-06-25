//
//  BayesTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/25/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class BayesTest: XCTestCase {

    
    //create classifier
    var classifier = NaiveBayes()
    
    
    override func setUp() {
        super.setUp()
    }
    
    
    //create a medical model..
    func testBayesMedicalModel() {
        
        var oneResults = Array<BayesResult>()
        
        
        oneResults.append(buildFeature("Chills", label: true))
        oneResults.append(buildFeature("Runny Nose", label: false))
        

        //establish outcome
        let oneOutcome: BayesResult = buildFeature("Flu", label: false)
        
        
        var oneTrial = classifier.train(oneResults, outcome: oneOutcome)
        
        
    }
    
    
    //helper function
    func buildFeature(feature: String, label: Bool) -> BayesResult {
        
        let newResult = BayesResult(feature: feature, label: label)
        return newResult
    }
    
}
