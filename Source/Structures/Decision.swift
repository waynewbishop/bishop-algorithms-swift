//
//  Decision.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/27/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation

//note: a decision tree node

class Decision <T: Equatable>{
    
    var results: Array<Outcome<T>>
    var left: Decision?
    var right: Decision?
    var question: AnyObject?
    var height: Int = 0
    
    init() {
        self.results = Array<Outcome<T>>()
    }
    
}
