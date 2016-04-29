//
//  EnumModel.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 4/25/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


//sample implementation model for the recursive enum model "Algorithm"

class EnumModel {
    
    
    func evaluate(algorithm: Algorithm) -> Array<Int>! {
        
        //mutated copy
        var output: Array<Int>!
        
        
        //actions based on scenarios
        switch algorithm {
          
            
        case .Empty:
            return nil
            
            
        case let .Sequence(numberList):
            return numberList
            

        /*
         scenario calls evaluate() recusivley and applies resulting data
        */
            
        case let .InsertionSort(numberList):
            
            //evaluate sequence
            output = evaluate(numberList)
            
            
            guard output.count > 2 else {
                return nil
            }
            
            for primaryindex in 0..<output.count {
                
                
                let key = output[primaryindex]
                
                var secondaryindex = primaryindex
                
                
                while secondaryindex > -1 {
                    
                    print("comparing \(key) and \(output[secondaryindex])")
                    
                    if key < output[secondaryindex] {
                        
                        //move into correct position
                        output.removeAtIndex(secondaryindex + 1)
                        output.insert(key, atIndex: secondaryindex)
                        
                    }
                    
                    secondaryindex -= 1
                }
                
                
            }
            
            return output
            
            
        //future algorithm case
        case .BubbleSort:
            print("subsequent sorting algorithm goes here..")
            return nil
            
        }
        
        
    }
    
    
}
