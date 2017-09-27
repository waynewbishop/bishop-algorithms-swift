//
//  Outcome.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/26/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation

//note: to manage specific decision tree outcomes.

class Outcome<T: Equatable> {
    
    var name: String
    var description: String?
    var result: T
    var type: LearningType
    
    init(_ name: String, result: T, type: LearningType = .Feature) {
        
        self.name = name
        self.result = result
        self.type = type
    }
    
}
