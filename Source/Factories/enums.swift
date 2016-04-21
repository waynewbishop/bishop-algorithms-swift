//
//  enums.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 4/21/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


//define the enum used to model behavior

indirect enum Algorithm {
    
    case Empty
    case Sequence(Array<Int>)
    case InsertionSort(Algorithm)
    case BubbleSort(Algorithm)
}


class EnumModel {
    
    
    
    func evaluate(algorithm: Algorithm) -> Array<Int>! {
        
        //mutated copy
        var output: Array<Int>!
        
        
        switch algorithm {
            
        case .Empty:
            return nil
            
            
        case let .Sequence(numberList):
            return numberList
            
            
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
        case let .BubbleSort(numberList):
            output = evaluate(numberList)
            return nil
            
        }
        

    }

    
}


