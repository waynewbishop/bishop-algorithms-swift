//
//  Quicksort.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/13/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation

/*
 notes: file established for testing purposes only. See the quickSort() method within the
 Array class extension for current implementation
*/


/*
class QuickSort {
    
    //var sequence: Array<Int> = [6, 5, 1, 3, 8, 4, 7, 9, 2]
    var sequence: Array<Int> = [7, 2, 1, 6, 8, 5, 3, 4]
    //var sequence: Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8]
    //var sequence: Array<Int> = [8, 2, 10, 9, 7, 5]
    //var sequence: Array<Int> = [0, 4, 7, 9, 13, 16, 34]
    //var sequence: Array<Int> = [2, 5, 3, 8, 9, 5, 6, 7]
    //var sequence: Array<Int> = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]
    //var sequence: Array<Int> = [1, 2, 3, 4, 5]

    
    //var sequence: Array<Int> = [8, 7, 6, 5, 4, 3, 2, 1]
    //var sequence: Array<Int> = [6, 5, 4, 3, 2, 1]
    //var sequence: Array<Int> = [7, 2, 6, 5, 2, 1]
    
    
    
    //determines sorting range - performance: O(n log(n))
    func quickSort() -> Array<Int> {
        
        
        func qSort(start startIndex: Int, _ pivot: Int) {
            
            if (startIndex < pivot) {
                let iPivot = qPartition(start: startIndex, pivot)
                qSort(start: startIndex, iPivot - 1)
                qSort(start: iPivot + 1, pivot)
            }
            
        }
        
        qSort(start: 0, sequence.endIndex - 1)
        return sequence
        
    }
    
    
    
    //sorts collection range based on pivot
    func qPartition(start startIndex: Int, _ pivot: Int) -> Int {
        
        var wallIndex: Int = startIndex
        
        
        //compare range with pivot
        for currentIndex in wallIndex..<pivot {
            
            print("current is: \(sequence[currentIndex]). pivot is \(sequence[pivot])")
            
            if sequence[currentIndex] <= sequence[pivot] {                
                if wallIndex != currentIndex {
                    swap(&sequence[currentIndex], &sequence[wallIndex])
                }
                
                //advance wall
                wallIndex += 1
            }
        }
        
        
        //move pivot to final position
        if wallIndex != pivot {
           swap(&sequence[wallIndex], &sequence[pivot])
        }
        
        return wallIndex
        
    }
    
}
 
*/

