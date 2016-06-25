//
//  BayesResult.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/24/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


struct BayesResult {
    
    var feature: String
    var label: Bool
    
    
    init(feature: String, label: Bool) {
        
        self.feature = feature
        self.label = label
    }
    
}
