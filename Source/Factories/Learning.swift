//
//  Learning.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/22/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation

class Learning {
    
    /*
    note: AEClassifier is a model trained with csv data built on MacOS.
    to review and experiment with this dataset access the specific MacOS
    playground file.
    */
    
    func AEPredict(using statement: String) -> AEClassifierResult? {

        
        let model = AEClassifier()
        
        guard let prediction = try? model.prediction(text: statement) else {
            fatalError("Unexpected runtime error.")
        }
  
        //obtain the results
        let results = prediction.label

        
        //assign the results to enum
        switch results {
    
        case "accurate":
            return AEClassifierResult.accurate
            
        case "exaggeration":
            return AEClassifierResult.exaggeration
            
        default:
            return nil
        }
        
    }
    
}
