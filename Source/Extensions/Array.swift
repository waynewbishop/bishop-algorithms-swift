 //
//  Array.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/1/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


extension Array where Element: Comparable {

    
    //MARK: Index Operation
    
    
    //returns middle index
    func midIndex() -> Index {
        return startIndex + (count / 2)
    }
    
    
    //MARK: - Binary Search
    
    
    /*
     binary search algorithm. Find the value at a specified index.
     note the use array slicing to adjust the upper and lower array bounds.
     returns true if the key was found in the sequence.
     */
    
    
    mutating func binarySearch(forElement key: Element) -> Bool {
        
        
        var result = false
        
        //establish indices
        let min = self.startIndex
        let max = self.endIndex - 1
        let mid = self.midIndex()
        
        
        //check bounds
        if key > self[max] || key < self[min] {
            print("search value \(key) not found..")
            return false
        }
        
        
        //evaluate chosen number..
        let n = self[mid]
        
        print(String(n) + " value attempted..")
        
        
        if n > key {
            var slice = Array(self[min...mid - 1])
            result = slice.binarySearch(forElement: key)
        }
            
        else if n < key {
            var slice = Array(self[mid + 1...max])
            result = slice.binarySearch(forElement: key)
        }
            
        else {
            print("search value \(key) found..")
            result = true
        }
        
        return result
    }

    
    
    //MARK: - Linear Search
    
    
     /*
     linear search algorithm - use fast enumeration to iterate through a sequence
     of values. performance of O(n).
     */
    
    func linearSearch(forElement key: Element) -> Bool {
                
        //check all possible values
        for number in self {
            if number == key {
                return true
            }
        }
        
        return false
        
    }

    
    //MARK: - Quick Sort
    
    /*
     quick sort algorithm - rank set of random numbers lowest to highest
     through the use of a "pivot" element and "wall". The pivot acts a source of
     comparision. The "wall" manages the sorted and unsorted
     sides of a collection. average performance of O(n log(n)).
    */
    
    
    mutating func qSort(_ start: Int = 0, _ end: Int = 0) {

        
        //initialize values
        var pivot: Int = end
        let wall: Int = start
        
        
        //check base case
        guard wall < pivot else {
            return
        }
        
        
        //divide sorted and unsorted halves - set new pivot
        pivot = qParition(wall, pivot)
        
        
        print(self)
        
        //sort left side
        qSort(wall, pivot - 1)
        
        print("made it this far..")
        
        qSort(pivot + 1, end)
        
    }
    
    
    mutating func qParition(_ start: Int, _ end: Int) -> Int {
        
        let pivot: Int = end
        var wall: Int = start
        
            for current in wall..<pivot {
                
                print(self)
                print("current is: \(self[current]). pivot is \(self[pivot])")
                
                if self[current] <= self[pivot] && wall != current {
                    swap(&self[current], &self[wall])
                    wall += 1
                    
                    print(self)
                }
            }
        
        
        //move pivot to final position
        if self[wall] > self[pivot] {
           swap(&self[wall], &self[pivot])
        }
        
        print(self)
        
        return wall
        
    }
    
    
    
    mutating func quickSort() -> Array<Element> {
        
        
        guard self.count > 1 else {
            return self
        }
        
        
        var sequence: Array<Element> = self

        
        //set indices
        //let pivot = output.endIndex - 1
        let pivot = 3 //output.midIndex()
        var wall = 0
        
        
        
        while wall != pivot {
            
            for current in wall..<pivot {
                
                print("current is: \(sequence[current]). pivot is \(sequence[pivot])")
                
                if sequence[current] <= sequence[pivot] {
                    
                    //swap positions
                    if wall != current {
                      swap(&sequence[wall], &sequence[current])
                    }
                    
                    //advance wall
                    wall += 1
                }
            }
            
            
            if wall == pivot {
                break
            }
            
            //completed evaluation of unsorted side - swap position values
            swap(&sequence[wall], &sequence[pivot])
            wall += 1
            
        }
        
        return sequence
        
        
    }

    
    
    
    
  
    //MARK: - Insertion Sort
    
    
    /*
     insertion sort algorithm - rank set of random numbers lowest to highest by
     inserting numbers based on a sorted and unsorted side. performance of O(n).
     */
   
    func insertionSort() -> Array<Element> {
        
        
        //check for trivial case
        guard self.count > 1 else {
            return self
        }
        
        
        var output: Array<Element> = self
        
        for primaryindex in 0..<output.count {
            
            let key = output[primaryindex]
            var secondaryindex = primaryindex
            
            
            while secondaryindex > -1 {
                
                print("comparing \(key) and \(output[secondaryindex])")
                
                if key < output[secondaryindex] {
                    
                    //move into correct position
                    output.remove(at: secondaryindex + 1)
                    output.insert(key, at: secondaryindex)
                }
                
                secondaryindex -= 1
            }
            
        }
        
        return output
        
    }
    
    
    
    
    //MARK: - Bubble Sort
    
    
    /*
     bubble sort algorithm - rank items from the lowest to highest by swapping
     groups of two items from left to right. The highest item in the set will bubble up to the
     right side of the set after the first iteration.
     */
    
    
    func bubbleSort() -> Array<Element> {
        
        
        //check for trivial case
        guard self.count > 1 else {
            return self
        }
        
        
        //mutated copy
        var output: Array<Element> = self
        
        
        for primaryIndex in 0..<self.count {
            
            
            let passes = (output.count - 1) - primaryIndex
            
            
            //"half-open" range operator
            for secondaryIndex in 0..<passes {
                
                let key = output[secondaryIndex]                
                
                print("comparing \(key) and \(output[secondaryIndex + 1])")
                
                //compare / swap positions
                if (key > output[secondaryIndex + 1]) {
                    swap(&output[secondaryIndex], &output[secondaryIndex + 1])
                }
            }
        }
        
        
        return output
        
    }
    
    
    
    //MARK: - Selection Sort
    
    /*
     selection sort algorithm - rank items from the lowest to highest by iterating through
     the array and swapping the current iteration with the lowest value in the rest of the array
     until it reaches the end of the array.
     */
    
    func selectionSort() -> Array<Element> {
        
        
        //check for trivial case
        guard self.count > 1 else {
            return self
        }
        
        
        //mutated copy
        var output: Array<Element> = self
        
        
        for primaryindex in 0..<output.count {
            
            
            var minimum = primaryindex
            var secondaryindex = primaryindex + 1
            
            
            while secondaryindex < output.count {
                
                print("comparing \(output[minimum]) and \(output[secondaryindex])")
                
                // store lowest value as minimum
                if output[minimum] > output[secondaryindex] {
                    minimum = secondaryindex
                }
                
                secondaryindex += 1
            }
            
            
            // swap minimum value with array iteration
            if primaryindex != minimum {
                swap(&output[primaryindex], &output[minimum])
            }
            
        }
        
        
        return output
        
    }

    
    
}
