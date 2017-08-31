//
//  Model.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/26/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//


import UIKit
import Foundation


class Model: ModelDelegate {
    
    
    let engine: ModelEngine = ModelEngine()
    
    init() {
        engine.delegate = self
    }
    
    
    //invoke delegation pattern
    func processContent(withElement element: Int) {
        engine.processContent(element)
    }
    
    
    //MARK: - Delegate Methods
    
    //invoked prior to process start
    func willProcessContent(message: String) {
        print(message)
    }
    
    
    //invoked after process completion
    func didProcessContent(results: Int) {
        print("the result is: \(results)")
    }
    
}

