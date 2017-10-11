//
//  String.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/1/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation



extension String: Keyable {
    
    //hash table requirement
    var keystring: String {
        return self
    }

    
    //compute the length
    var length: Int {
       return self.count
    }
    
    //determine if all characters are unique
    func isStringUnique() -> Bool {
        
        //evaluate trival case
        guard self.characters.count < 128 else {
            return false
        }
        
        //match unicode representation - O(n)
        var list = Array<Bool?>(repeatElement(nil, count: 256))
        
        for key in self.unicodeScalars {
            let intKey = Int(key.value)
            
            if list[intKey] != nil {
                return false
            }
            
            list.insert(true, at: Int(key.value))
        }
        
        return true
        
    }

    
    
    //formats a string to date format
    var datevalue: Date! {
      
        let stringFormatter = DateFormatter()
        stringFormatter.dateFormat = "MM-dd-yyyy"
        stringFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        //check for correct date format
        if let d = stringFormatter.date(from: self) {
            return Date(timeInterval: 0, since: d)
        }
        else {
            return nil
        }

    }
    
    
    //returns characters up to a specified integer 
    func substring(to: Int) -> String {
        
        //define the range
        let range = self.index(self.startIndex, offsetBy: to)
        
       //return self.substring(to: range) - Swift 3.0
        
        return String(self[..<range])
    }
    
    
    //replace string content
    func replace(element:String, replacement:String) -> String {
        return self.replacingOccurrences(of: element, with: replacement)
    }
    
    
    //removes empty string content
    func removingWhitespace() -> String {
        return self.replace(element: " ", replacement: "")
    }
    
    
    //convert a string into a character array
    func characters() ->Array<Character> {
        return Array(self.characters)
    }

    
    
    //reverse string order
    func reverse() -> String! {
        
         /*
         notes: While this operation would normally be done with the 
         native characters.reversed() method, this has been added as an example interview question.
         */
        
        //convert to array
        var characters = self.characters()
        
        var findex: Int = characters.startIndex
        var bindex: Int = characters.endIndex - 1
        
        
        while findex < bindex {
            
            //swap(&characters[findex], &characters[bindex]) - Swift 3.0
            characters.swapAt(findex, bindex)
            
            //update values
            findex += 1
            bindex -= 1
            
            
        } //end while
        
        
        return String(characters)
        
    }
    
    
}
