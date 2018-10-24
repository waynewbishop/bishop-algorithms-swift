//
//  Learning.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/22/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation

typealias AEClassifierResult = String

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

        
        //return predicted value - String
        return prediction.label

        }
        
    }

