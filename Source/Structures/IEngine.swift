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
    func didProcessContent(results: Int)
}



class IEngine {

    //create protocol instance
    var delegate: IEngineDelegate?
    
    
    
    //replicate long running process
    func processContent(_ element: Int) {

        
        //send initiation message
        delegate?.willProcessContent(message: "engine processing successfully initiated..")
        
        
        //perform some basic test operation
        let output = element * 2
        
        
        /*
        note: In a real application, this content processing could be executed
        on a background thread through GCD or some other multithreaded execution.
        */
        sleep(2)
        
        

        //send message (on main thread)
        delegate?.didProcessContent(results: output)
    }
    
}
