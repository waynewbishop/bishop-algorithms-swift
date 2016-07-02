//
//  Sorting.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/2/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class Sorting {
    
    
    //MARK: - Binary Search
    
    
    /*
    binary search algorithm. Find the value at a specified index.
    note the use array slicing to adjust the upper and lower array bounds.
    returns true if the key was found in the sequence.
    */
    
    
    func binarySearch(_ sequence: Array<Int>, _ key: Int) -> Bool {

        var result = false
        
        //establish indices - extensions
        let min = sequence.minIndex()
        let max = sequence.maxIndex()
        let mid = sequence.midIndex()
        
        
        //check bounds
        if key > sequence[max] || key < sequence[min] {
            print("search value \(key) not found..")
            return false
        }
        
        
        //evaluate chosen number..
        let n = sequence[mid]
        
        print(String(n) + " value attempted..")
        
        
        if n > key {
            let slice: Array<Int> = Array(sequence[min...mid - 1])
            result = self.binarySearch(slice, key)
        }
        
        else if n < key {
            let slice: Array<Int> = Array(sequence[mid + 1...max])
            result = self.binarySearch(slice, key)
        }
        
        else {
            print("search value \(key) found..")
            result = true
        }
        
        return result
    }
    
    
    
    
    //MARK: - Linear Search
    
    
    /*
    linear search - use fast enumeration to iterate through a sequence
    of values. algorithm performance of O(n).
    */
    
    func linearSearch(_ numberlist: Array<Int>, key: Int) {

        
        //check all possible values
        for number in numberlist {
            if number == key {
                print("value at key: \(key) found..")
                break
            }
        }
        
    }
    
    
    //MARK: - Insertion Sort
    
    
    /*
    insertion sort algorithm - rank set of random numbers lowest to highest by
    inserting numbers based on a sorted and unsorted side.
    */
    
    func insertionSort(_ numberList: Array<Int>) -> Array<Int> {
        
        
        //check for trivial case
        guard numberList.count > 1 else {
            return numberList
        }
        
        
        //mutated copy
        var output = numberList
        
        
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
    
    
    

    /*
    insertion sort algorithm - generic
    */
    
    func insertionSortG<T: Comparable>(_ sequence: [T]) -> [T] {

        
        // immediately return the trivial cases
        guard sequence.count > 1 else {
            return sequence
        }

        //mutated copy
        var output = Array(sequence)
        
       
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

    
    func bubbleSort(_ numberList: Array<Int>) -> Array<Int> {

        
        //check for trivial case
        guard numberList.count > 1 else {
            return numberList
        }
        
        
        //mutated copy
        var output = numberList
        
        
        for primaryIndex in 0..<numberList.count {
            
            
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
    
    
    /*
    bubble sort algorithm - generic
    */
    
    func bubbleSortG<T: Comparable>(_ sequence: [T]) -> [T] {

        
        //return trvial case
        guard sequence.count > 1 else {
            return sequence
        }
        
        
        //mutated copy
        var output = Array(sequence)

        
        for primaryIndex in 0..<sequence.count {
            
            
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
    
    func selectionSort(_ numberList: Array<Int>) -> Array<Int> {
        
        
        //check for trivial case
        guard numberList.count > 1 else {
            return numberList
        }
        
        
        //mutated copy
        var output = numberList
        
        
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

    
    
    /*
    selection sort algorithm - generic
    */
    
    func selectionSortG<T: Comparable>(_ sequence: [T]) -> [T] {
        

        //check for trivial case
        guard sequence.count > 1 else {
            return sequence
        }

        
        //mutated copy
        var output = Array(sequence)
        
        
        for primaryindex in 0..<output.count {

            
            //set indicies
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


