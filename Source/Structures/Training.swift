//
//  TrainingSet.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/26/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//


import Foundation

//note: the decision tree training set

class Training <T: Equatable> {
    
    var rows = Array<Outcome<T>>()
    var name: String?
    var description: String?
    private var counter: Int = 0
}


//TODO: Use subscripts to retrieve data from specific training rows.

