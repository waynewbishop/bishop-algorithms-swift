//
//  NaiveBayes.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/24/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


class NaiveBayes {
    
    var bayesEvents = Array<BayesResult>()

    
    //add results to event list
    func train(event: Array<BayesResult>) {

        
        //trivial case
        guard event.count != 0 else {
            return
        }
        
        
        //TODO: //calculate probabilities for all results as they compare to the outcome
        
    }
    
    
    //estimate outcome based on results
    func predict(event: Array<BayesResult>) {
        
    }

}
