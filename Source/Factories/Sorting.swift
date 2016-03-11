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
    
    
    func binarySearch(sequence: Array<Int>, key: Int) -> Bool {

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
            result = self.binarySearch(slice, key: key)
        }
        
        else if n < key {
            let slice: Array<Int> = Array(sequence[mid + 1...max])
            result = self.binarySearch(slice, key: key)
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
    
    func linearSearch(numberlist: Array<Int>, key: Int) {

        
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
    
    func insertionSort(numberList: Array<Int>) -> Array<Int> {
        

        //check for trivial case
        guard numberList.count > 1 else {
            return numberList
        }
        
        
        //mutated copy
        var output = numberList
        
        
        for primaryIndex in 0..<output.count {
            
            let key = output[primaryIndex]
            
            
            for var secondaryIndex = primaryIndex; secondaryIndex > -1; secondaryIndex-- {
                
                print("comparing \(key) and \(output[secondaryIndex])")
                
                if key < output[secondaryIndex] {
                    
                    //move into correct position
                    output.removeAtIndex(secondaryIndex + 1)
                    output.insert(key, atIndex: secondaryIndex)
                    
                }
            }
        }
        
        
        return output
        
    }

    
    

    /*
    insertion sort algorithm - (Generics)
    */
    
    func insertionSortG<T: Comparable>(sequence: [T]) -> [T] {

        
        // immediately return the trivial cases
        guard sequence.count > 1 else {
            return sequence
        }

        //mutated copy
        var output = Array(sequence)
        
        
        for primaryIndex in 0..<output.count {
            
            let key = output[primaryIndex]
            
            
            for var secondaryIndex = primaryIndex; secondaryIndex > -1; secondaryIndex-- {
                
                print("comparing \(key) and \(output[secondaryIndex])")
                
                if key < output[secondaryIndex] {

                    //move into correct position
                    output.removeAtIndex(secondaryIndex + 1)
                    output.insert(key, atIndex: secondaryIndex)
                    
                }
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

    
    func bubbleSort(numberList: Array<Int>) -> Array<Int> {

        
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
    bubble sort algorithm - (Generics)
    */
    
    func bubbleSortG<T: Comparable>(sequence: [T]) -> [T] {
        
        // immediately return the trivial cases
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

    func selectionSort(numberList: Array<Int>) -> Array<Int> {
        

        //check for trivial case
        guard numberList.count > 1 else {
            return numberList
        }
 
        
        //mutated copy
        var output = numberList
        
        
        for primaryIndex in 0..<output.count {
            
            var minimum = primaryIndex
            
            // iterate through remainder
            for var secondaryIndex = primaryIndex + 1; secondaryIndex < output.count; secondaryIndex++ {
                
                
                print("comparing \(output[minimum]) and \(output[secondaryIndex])")
                
                // store lowest value as minimum
                if output[minimum] > output[secondaryIndex] {
                    minimum = secondaryIndex
                }
            }
            
            
            // swap minimum value with array iteration
            if primaryIndex != minimum {
                swap(&output[primaryIndex], &output[minimum])
            }
            
        }
        
        
        return output
        
    }
    
    
    /*
    selection sort algorithm - (Generics)
    */
    
    func selectionSortG<T: Comparable>(sequence: [T]) -> [T] {
        
        // immediately return the trivial cases
        guard sequence.count > 1 else {
            return sequence
        }

        
        //mutated copy
        var output = Array(sequence)
        
        
        for primaryIndex in 0..<output.count {
            
            var minimum = primaryIndex
            
            // iterate through remainder
            for var secondaryIndex = primaryIndex + 1; secondaryIndex < output.count; secondaryIndex++ {
                
                
                print("comparing \(output[minimum]) and \(output[secondaryIndex])")
                
                // store lowest value as minimum
                if output[minimum] > output[secondaryIndex] {
                    minimum = secondaryIndex
                }
            }
            
            
            // swap minimum value with array iteration
            if primaryIndex != minimum {
                swap(&output[primaryIndex], &output[minimum])
            }
            
        }
        
        
        return output
        
    }

    
    //MARK: - Other Sorting Algorithms
    
    
 	
		// quick sort - works by dividing and conquering
		// Firstly it picks a pivot point then looks at all items in the observed array
		// and moves values to the left or right of the pivot based on their value
		// it works recursively so that either side will be eventually sorted back to the top

		func quickSort(var hops:[Int]) -> [Int] {
            
			guard hops.count > 1 else { return hops } // immediately return the trivial cases
			
			let pivot = hops.removeAtIndex(0)
			var leftBucket:[Int] = []
			var rightBucket:[Int] = []
			
			(hops.count - 1).times { i in
				if (hops[i] <= pivot) {
					leftBucket.append(hops[i])
				} else {
					rightBucket.append(hops[i])
				}
			}
			
			var mergedArray:[Int] = []
			mergedArray += quickSort(leftBucket)
			mergedArray += [pivot]
			mergedArray += quickSort(rightBucket)
			
			return mergedArray
		}
	
	
        /*
		merge sort - works by breaking down each side and sorting as it comes back up
		Each left and right side is sorted by using pointers as to which value should be included
		to sort, as each side is sorted as it comes back up the "tree" we can be sure that our pointers
		can be safely moved left to right whereby the values are increasing 
        */
    
		func mergeSort(input:[Int]) -> [Int] {
            
            guard input.count > 1 else { return input } // immediately return the trivial cases

			
            //find the mid point of the input and move them into two buckets
			let mid = input.startIndex + (input.count / 2)
			let left = input.startIndex..<mid
			let right = mid..<input.endIndex
			

            //recursive call here to continue to divide each side
			let leftSide = mergeSort(Array<Int>(left))
			let rightSide = mergeSort(Array<Int>(right))
			
            //conquer for each method invocation
			return mergeSortedLeft(leftSide, andRight: rightSide)
		}
		
    
		func mergeSortedLeft(left:[Int], andRight right:[Int]) -> [Int] {
			
            let totalElements = left.count + right.count
            
            guard totalElements > 0 else { return [] }  // make sure we have something to do
            
            
            //create a new array to place our sorted numbers
			var sortedArray:[Int] = []
            sortedArray.reserveCapacity(totalElements)
            
            
            var leftGenerator = left.generate()         // Generate the sequence of left side elements
            var rightGenerator = right.generate()       // Generate the sequence of right side elements
            
            var leftHead = leftGenerator.next()         // Left side head element or nil if left is empty
            var rightHead = rightGenerator.next()       // Right side head element or nil if right is empty
            
            MERGE: while true {
                switch (leftHead, rightHead) {
                    
                case let(l?, r?) where l <= r:          // Both left and right heads exists and left head is less than or equal to right head
                    sortedArray.append(l)               // we append left head to sorted array
                    leftHead = leftGenerator.next()     // and advance left head
                    
                case let(l?, r?) where l > r:           // Both left and right heads exists and left head is grater than right head
                    sortedArray.append(r)               // we append right head to sorted array
                    rightHead = rightGenerator.next()   // and advance right head
                    
                case let(nil, r?):                      // Left head is nil (i.e.: exausted), hance we only have right elements
                    sortedArray.append(r)               // we append right head to sorted array
                    rightHead = rightGenerator.next()   // and advance right head
                    
                case let(l?, nil):                      // Right head is nil (i.e.: exausted), hance we only have left elements
                    sortedArray.append(l)               // we append left head to sorted array
                    leftHead = leftGenerator.next()     // and advance left head
                    
                case (nil, nil):                        // Both left and right heads are nil, thus we exausted both sides
                    break MERGE                         // we break the MERGE loop
                    
                default:                                // We already covered all possible cases but this is still necessary as of Swift 2
                    break MERGE
                }
            }
			
			return sortedArray
		}
	
    
}
