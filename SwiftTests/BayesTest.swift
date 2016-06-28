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

    
    //establish classifier
    var classifier = NaiveBayes()
    
    var flu, chills, runnyNose, headache, fever: BayesFeature!
    
    
    override func setUp() {
        super.setUp()

        
        chills = BayesFeature("Chills")
        runnyNose = BayesFeature("Runny Nose")
        headache = BayesFeature("Headache")
        fever = BayesFeature("Fever")

        
        //establish outcome feature
        flu = BayesFeature("Flu")
        flu.isOutcome = true
        
    }

    
    
    func testBayesModel() {

        var bayesEvent = Array<BayesResult>()
        
        //chills result
        var chillsResult = BayesResult(feature: chills)
        
        //TODO: This needs to be merged into its own line..
        chillsResult.labels.append(true)
        
        bayesEvent.append(chillsResult)
        
        
        //TODO: Repeat process for every
    
        
        
    }
    
 
}
