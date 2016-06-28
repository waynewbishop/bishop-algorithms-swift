//
//  BayesResult.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/24/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


/*
 notes: following a naive bayes model, the test results of specific features are tracked.
 multiple outcomes are grouped as labels
*/

struct BayesResult {

    
    var feature: BayesFeature
    var labels: Array<Bool>
    var p: Float = 0.0
    
    
    init(feature: BayesFeature) {
        
        self.feature = feature
        self.labels = Array<Bool>()
    }
    
    
    //add a result
    mutating func addLabel(label: Bool) {
        labels.append(label)
    }
    
    
}
