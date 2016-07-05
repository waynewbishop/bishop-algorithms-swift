//
//  EnumModel.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 4/25/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


//sample implementation model for the recursive enum model "Algorithm"

class EnumModel{
    
    
    func evaluate<T: Comparable>(withModel model: Algorithm<T>) -> Array<T>! {

        
        switch model {

            
        case .Empty:
            return nil

            
        case let .Elements(elementList):
            return elementList
            
            
        case let .InsertionSort(elementList):
            
            
            //evaluate sequence
            let output = evaluate(withModel: elementList)
            return output?.insertionSort()
            

        case let .BubbleSort(elementList):
            
            
            //evaluate sequence
            let output = evaluate(withModel: elementList)
            return output?.bubbleSort()

            
        case let .SelectionSort(elementList):

            
            //evaluate sequence
            let output = evaluate(withModel: elementList)
            return output?.selectionSort()
            
            
        } //end switch
        
        
    }
    
    
}
