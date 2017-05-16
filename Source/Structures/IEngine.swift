//
//  IEngine.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 5/16/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation


//set conforming rules
protocol IEngineDelegate {
    
    func willProcessContent(message: String)
    func didProcessContent(message: String)
}



class IEngine {

    //create protocol instance
    var delegate: IEngineDelegate?
    
    
    init() {
        
        //send message
        delegate?.willProcessContent(message: "engine processing successfully initiated..")
    }
    
    
    
    //replicate long running process
    func processContent(withElement element: Int) {
        
        /*
        note: In a real application, this content processing could be executed
        on a background thread through GCD or some other multithreaded execution.
        */
        sleep(5)
        
        
        //perform some basic test operation
        let results = element * 2
        

        //send message (on main thread)
        delegate?.didProcessContent(message: "results are: \(results)")
    }
    
}
