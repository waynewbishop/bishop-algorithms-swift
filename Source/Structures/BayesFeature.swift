//
//  BayesFeature.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/27/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation



struct BayesFeature {
    
    var feature: String
    var isOutcome: Bool = false

    
    init(_ feature: String) {
        self.feature = feature
    }
    
}