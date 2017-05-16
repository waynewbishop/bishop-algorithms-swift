//
//  Delegation.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 5/16/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Delegation: IEngineDelegate {
    
    let iEngine = IEngine()
    let element: String

    
    
    //set class values
    init(withElement: String) {
       
       element = withElement
       iEngine.delegate = self
    }

    
    //start main process
    func processContent() {
        iEngine.processContent(withElement: element)
    }
    
    
    //MARK: - Delegate Methods

    
    //invoked prior to process start
    func willProcessContent(message: String) {
       print(message)
    }

    
    //invoked after process completion
    func didProcessContent(message: String) {
        print("results are: \(message)")
    }
    
}
