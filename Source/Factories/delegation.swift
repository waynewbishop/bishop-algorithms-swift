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
    
    
    init(withElement: String) {
       iEngine.delegate = self
    }

    
    //start main process
    func processContent() {
        iEngine.processContent(withElement: 5)
    }
    
    
    //MARK: - Delegate Methods

    
    //invoked prior to process start
    func willProcessContent(message: String) {
       print(message)
    }

    
    //invoked after process completion
    func didProcessContent(message: String) {
        print("the result is: \(message)")
    }
    
}
