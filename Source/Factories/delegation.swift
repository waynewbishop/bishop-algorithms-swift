//
//  Delegation.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 5/16/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation


/*
 note: This class describes the Delegation design pattern.
*/


class Delegation: IEngineDelegate {
    
    let iEngine = IEngine()
    
    
    init() {
       iEngine.delegate = self
    }

    
    //start main process
    func processContent(withElement element: Int) {
        iEngine.processContent(element)
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
