//
//  Sorting.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/2/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation

public class Sorting {
    
    var isKeyFound: Bool = false
    
    
    /*
    binary search algorthim. Find the value at the middle index.
    note the use of the tuple to organize the upper and lower search bounds.
    */
    
    func binarySearch(var numberList: Array<Int>, key: Int, range:(imin: Int, imax: Int)) {
    
    
        let midIndex: Double = round(Double((range.imin + range.imax) / 2))
        let midNumber = numberList[Int(midIndex)]
    
    
        //use recursion to reduce the possible search range
        if (midNumber > key ) {
            binarySearch(numberList, key: key, range: (range.imin, Int(midIndex) - 1))
        
    
        //use recursion to increase the possible search range
        } else if (midNumber < key ) {
            binarySearch(numberList, key: key, range: (Int(midIndex) + 1, range.imax))
            
            
        } else {
            isKeyFound = true
            print("value \(key) found..")
        }
        
        
    } //end function
    

    
    /*
    insertion sort algorithm - rank set of random numbers lowest to highest by
    inserting numbers based on a sorted and unsorted side.
    */
    
    func insertionSort(var numberList: Array<Int>) -> Array<Int> {
        
        var y, key : Int
        

        for x in 0..<numberList.count {
            
            //obtain a key to be evaluated
            key = numberList[x]
            
            
            //iterate backwards through the sorted portion
            for (y = x; y > -1; y--) {
                
                print("comparing \(key) and \(numberList[y])")

                
                if key < numberList[y] {
                    
                    //remove item from original position
                    numberList.removeAtIndex(y + 1)
                    
                    //insert the number at the key position
                    numberList.insert(key, atIndex: y)
                    
                }
                
            } //end for
            
            
        } //end for
        
        
        return numberList
        
        
    } //end function
    
    
    /*
    bubble sort algorithm - rank items from the lowest to highest by swapping
    groups of two items from left to right. The highest item in the set will bubble up to the
    right side of the set after the first iteration.
    */
    
    func bubbleSort(var numberList: Array<Int>) ->Array<Int> {
        
        var z, passes, key : Int
        
        //track collection iterations
        for x in 0..<numberList.count {
            
            passes = (numberList.count - 1) - x;
            
            //use shorthand "half-open" range operator
            
            for y in 0..<passes {
                key = numberList[y]
                
                print("comparing \(key) and \(numberList[y + 1])")
                
                //compare and rank values
                if (key > numberList[y + 1]) {
                    
                    z = numberList[y + 1]
                    numberList[y + 1] = key
                    numberList[y] = z
                    
                }
                
            } //end for
            
        } //end for
        
        
        return numberList
        
    } //end function
    
    
    /*
    selection sort algorithm - rank items from the lowest to highest by iterating through
    the array and swapping the current iteration with the lowest value in the rest of the array
    until it reaches the end of the array.
    */
    
    func selectionSort(var numberList: Array<Int>) ->Array<Int> {
        
        var y : Int
        
        // iterate through the entire array
        for x in 0..<numberList.count {
            
            // start minimum value at first element of the iteration
            var minimum = x
            
            // iterate through the rest of the array (x+1 to the end of the array)
            for y = x+1; y < numberList.count; y++ {
                
                print("comparing \(numberList[minimum]) and \(numberList[y])")
                
                // store the lowest value as minimum
                if numberList[minimum] > numberList[y] {
                    minimum = y
                }
                                
            } //end for
            
            // swap the minimum value with the current array iteration
            let z = numberList[x]
            numberList[x] = numberList[minimum]
            numberList[minimum] = z
            
        } //end for
    
        
        return numberList
        
    } //end function
    
    
 	
		// quick sort - works by dividing and conquering
		// Firstly it picks a pivot point then looks at all items in the observed array
		// and moves values to the left or right of the pivot based on their value
		// it works recursively so that either side will be eventually sorted back to the top

		func quickSort(var hops:[Int]) -> [Int] {
			
			if (hops.count <= 1) {
				return hops
			}
			
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
            
            //establish the base case
			if (input.count <= 1) {
				return input
			}
			
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
	
    
}
