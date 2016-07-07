//
//  Algorithm.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 4/25/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


//recusive enum used to help build example Algorithm "models"

indirect enum Algorithm<T> {
    
    case Empty
    case Elements(Array<T>)
    case InsertionSort(Algorithm<T>)
    case BubbleSort(Algorithm<T>)
    case SelectionSort(Algorithm<T>)
    
}


//enum used to determine Hashlist algorithm processing

enum HashResults {
    
    case Success
    case Fail
    case NoType
}
