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
        
    }
    
    
    

    /*
    insertion sort algorithm - generic
    */
    
    func insertionSortG<T: Comparable>(sequence: [T]) -> [T] {

        
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
                    output.removeAtIndex(secondaryindex + 1)
                    output.insert(key, atIndex: secondaryindex)
                    
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
    bubble sort algorithm - generic
    */
    
    func bubbleSortG<T: Comparable>(sequence: [T]) -> [T] {

        
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
    
    func selectionSort(numberList: Array<Int>) -> Array<Int> {
        
        
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
    
    func selectionSortG<T: Comparable>(sequence: [T]) -> [T] {
        

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

    
    //MARK: - Other Sorting Algorithms - to be refactored
    
    
 	
		// quick sort - works by dividing and conquering
		// Firstly it picks a pivot point then looks at all items in the observed array
		// and moves values to the left or right of the pivot based on their value
		// it works recursively so that either side will be eventually sorted back to the top

 /*
    
		func quickSort(sequence:[Int]) -> [Int] {
            
            // immediately return the trivial cases
			guard sequence.count > 1 else {
                return sequence
            }
            
            //mutated copy
            var hops = sequence

            
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
			let mid = Int(floor(Double(input.count / 2)))
			let left = Array(input[0..<mid])
			let right = Array(input[mid..<input.count])
			

            //recursive call here to continue to divide each side
			let leftSide = mergeSort(left)
			let rightSide = mergeSort(right)
			
            //conquer for each method invocation
			return sortForMergeSort(leftSide, right: rightSide)
		}
		
    
		func sortForMergeSort(left:[Int], right:[Int]) -> [Int] {
			
            //create a new array to place our sorted numbers
			var sortedArray:[Int] = []
			var leftCount = 0
			var rightCount = 0
            
            /*
            var someCount: Int = left.count + right.count
            
            for i in 0...someCount {
                println(i)
            }
            */
            
            
			// For all of the numbers on both sides
			(left.count + right.count).times { i in
                
                /*
                if we've exhausted the right side, or if we still have some to use on
                the left side and the current left side number is smaller in value than the
                right sides current value, then add the left numbers value to the sorted array
                */
                
				if (leftCount < left.count && (rightCount >= right.count || left[leftCount] <= right[rightCount])) {
 
					sortedArray.append(left[leftCount++])
                    
				} else if (rightCount < right.count && (leftCount >= left.count || right[rightCount] < left[leftCount])) {
 
					sortedArray.append(right[rightCount++])
                    
				}
			}
			
			return sortedArray
		}
 
  */
    
 
}


