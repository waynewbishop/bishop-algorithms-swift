//
//  BayesEvent.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/24/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


struct BayesEvent {

    var features: Array<BayesResult>
    var outcome: BayesResult!
    
    
    init() {
        self.features = Array<BayesResult>()
    }
    
}