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
    
    
        var midIndex: Double = round(Double((range.imin + range.imax) / 2))
        var midNumber = numberList[Int(midIndex)]
    
    
        //use recursion to reduce the possible search range
        if (midNumber > key ) {
            binarySearch(numberList, key: key, range: (range.imin, Int(midIndex) - 1))
        
    
        //use recursion to increase the possible search range
        } else if (midNumber < key ) {
            binarySearch(numberList, key: key, range: (Int(midIndex) + 1, range.imax))
            
            
        } else {
            isKeyFound = true
            println("value \(key) found..")
        }
        
        
    } //end function
    


    
    /*
    insertion sort algorithm - rank set of random numbers lowest to highest by
    inserting numbers based on a sorted and unsorted side.
    */
    
    func insertionSort(var numberList: Array<Int>) -> Array<Int> {
        
        var x, y, key : Int
        
        
        for (x = 0; x < numberList.count; x++) {

            //obtain a key to be evaluated
            key = numberList[x]
            
            
            //iterate backwards through the sorted portion
            for (y = x; y > -1; y--) {
                
                println("comparing \(key) and \(numberList[y])")
                
                if (key < numberList[y]) {
                    
                
                    //remove item from original position
                    numberList.removeAtIndex(y + 1)
                    
                    //insert the number at the key position
                    numberList.insert(key, atIndex: y)
                    
                }
                
            }
            
            
        } //end for
        
        
        return numberList
        
        
    } //end function
    
    
    
    
    
    /*
    bubble sort algorithm - rank items from the lowest to highest by swapping
    groups of two items from left to right. The highest item in the set will bubble up to the
    right side of the set after the first iteration.
    */
    
    func bubbleSort(var numberList: Array<Int>) ->Array<Int> {
        
        var x, y, z, passes, key : Int
        
        //track collection iterations
        for x in 0..<numberList.count {
            
            passes = (numberList.count - 1) - x;
            
            //use shorthand "half-open" range operator
            
            for y in 0..<passes {
                key = numberList[y]
                
                println("comparing \(key) and \(numberList[y + 1])")
                
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
    
    
 	
		// Quick sort works by dividing and conquering
		// Firstly it picks a pivot point then looks at all items in the observed array
		// and moves values to the left or right of the pivot based on their value
		// it works recursively so that either side will be eventually sorted back to the top

		func quickSort(var hops:[Int]) -> [Int] {
			
			if (hops.count <= 1) {
				return hops
			}
			
			var pivot = hops.removeAtIndex(0)
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
	
	
		// Merge sort works by breaking down each side and sorting as it comes back up
		// Each left & right side is sorted by using pointers as to which value should be included
		// to sort, as each side is sorted as it comes back up the "tree" we can be sure that our pointers
		// can be safely moved left to right whereby the values are increasing
		func mergeSort(input:[Int]) -> [Int] {
			
			if (input.count <= 1) {
				return input
			}
			
			let mid = Int(floor(Double(input.count / 2)))
			let left = Array(input[0..<mid])
			let right = Array(input[mid..<input.count])
			
			let leftSide = mergeSort(left)
			let rightSide = mergeSort(right)
			
			return sortForMergeSort(leftSide, right: rightSide)
		}
		
		func sortForMergeSort(left:[Int], right:[Int]) -> [Int] {
			
			var sortedArray:[Int] = []
			var leftCount = 0
			var rightCount = 0
			
			(left.count + right.count).times { i in
				if (leftCount < left.count && (rightCount >= right.count || left[leftCount] <= right[rightCount])) {
					sortedArray.append(left[leftCount++])
				} else if (rightCount < right.count && (leftCount >= left.count || right[rightCount] < left[leftCount])) {
					sortedArray.append(right[rightCount++])
				}
			}
			
			return sortedArray
		}
	
    
}
