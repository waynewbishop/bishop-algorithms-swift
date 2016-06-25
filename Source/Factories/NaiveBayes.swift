//
//  NaiveBayes.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/24/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


class NaiveBayes {


    //refers to sample space
    var space: Array<BayesEvent>
    
    
    init() {
        space = Array<BayesEvent>()
    }
    
    
    //create new event
    func train(features: Array<BayesResult>, outcome: BayesResult) {

        
        var bayesEvent: BayesEvent = BayesEvent()
        
        
        //check for trivial case
        guard features.count != 0 else {
            return
        }

        
        bayesEvent.features = features
        bayesEvent.outcome = outcome
        
        
        //add to proability space
        space.append(bayesEvent)
        
    }
    
        
    //predict based on specific result
    func predict(features: Array<BayesResult>) -> BayesResult! {
        
        //TODO: pull all events from probability space
        
        return nil
    }
    
    
}