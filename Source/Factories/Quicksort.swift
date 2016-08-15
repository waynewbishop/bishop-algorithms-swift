//
//  Quicksort.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/13/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


class QuickSort {
    
    //var sequence: Array<Int> = [6, 5, 1, 3, 8, 4, 7, 9, 2]
    //var sequence: Array<Int> = [7, 2, 1, 6, 8, 5, 3, 4]
    //var sequence: Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    //var sequence: Array<Int> = [8, 2, 10, 9, 7, 5]
    var sequence: Array<Int> = [0,4,7,9,13,16,34]

    
    func qSort() {

 
        //starting pivot
        let iPivot = qPartition(start: 0, sequence.endIndex - 1)
        
        
        var leftPivot: Int = iPivot
        var rightPivot: Int = iPivot
        
        
        //sort left side
        while leftPivot > 0 {
            leftPivot = qPartition(start: 0, leftPivot - 1)
        }
        
        
        ///sort right side
        while rightPivot < sequence.endIndex - 1 {
            rightPivot = qPartition(start: rightPivot + 1, sequence.endIndex - 1)
        }
                
        
    }
    
    
    
    func qPartition(start startIndex: Int, _ pivot: Int) -> Int {
        
        var wallIndex: Int = startIndex
        
        
        //compare range with pivot
        for currentIndex in wallIndex..<pivot {
            
            print("current is: \(sequence[currentIndex]). pivot is \(sequence[pivot])")
            if sequence[currentIndex] <= sequence[pivot] {
                
                
                /*
                 note: swift logic
                 is required to prevent swapping "potentially" equal array
                 indicies. With QuickSort, there  are often scenarios where 
                 the current and wall indicies will be equilvalent.
                */
                
                
                if wallIndex != currentIndex {
                    swap(&sequence[currentIndex], &sequence[wallIndex])
                }
                
                wallIndex += 1
            }
            
        }
        
        
        //move pivot to final position
        if sequence[wallIndex] > sequence[pivot] {
            swap(&sequence[wallIndex], &sequence[pivot])
        }
        
        
        //reuse the wall
        return wallIndex
        
    }
    
    
}
