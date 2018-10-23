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
    
    func AEPredict(using statement: String) -> Bool {

        //create a new classifier
        let model = AEClassifier()
                
        if let prediction = try? model.prediction(text: statement) {
            if prediction.label.contains("acc") {  //accurate..
              return true
            }
            else {
              return false
            }
        }
        
        return false
    }
    
}
