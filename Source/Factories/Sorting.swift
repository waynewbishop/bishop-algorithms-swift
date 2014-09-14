//
//  Sorting.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/2/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation

public class Sorting {
    
   private var numberList : Array<Int> = [8, 2, 10, 9, 11, 1, 15]
    
    /* 
    insertion sort algorithm - rank set of random numbers lowest to highest by
    inserting numbers based on a sorted and unsorted side.
    */
    
    public func insertionSort() {
        
        var x, y, key : Int
        
        
        for (x = 0; x < numberList.count; x++) {

            //obtain a key to be evaluated
            key = numberList[x]
          
            
            if (key == 1){
                println("stop.")
            }
            
            
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
        
        
    } //end function
    
    
    
    
    
    /*
    bubble sort algorithm - rank items from the lowest to highest by swapping
    groups of two items from left to right. The highest item in the set will bubble up to the
    right side of the set after the first iteration.
    */
    
   public func bubbleSort() {
        

        //establish the iteration counters
        var x, y, z, passes, key : Int

        
        for (x = 0; x < numberList.count; ++x) {
            
            //outer loop is maintained to track how many iterations to pass through the list
            passes = (numberList.count - 1) - x;
            
            
                for (y = 0; y < passes; y++) {
                    
                    //obtain the key item to sort
                    key = numberList[y]
                    
                    
                    println("comparing \(key) and \(numberList[y + 1])")
                    
                    
                        if (key > numberList[y + 1]) {
                            
                            //pull out the value to be swapped
                            z = numberList[y + 1]
                            
                            
                            //write the key where the previous value was placed
                            numberList[y + 1] = key
                            
                            
                            //place the pulled value in the previous position
                            numberList[y] = z
                            
                            
                            
                        } //end if

                    
                } //end for

            
        } //end for
        
 
    } //end function
    
    
    
    
}
