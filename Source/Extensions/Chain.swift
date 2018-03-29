//
//  Chain.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 3/28/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


extension Blockchain {
    

    //initialize starting block
    func genesisBlock()-> Block {
        
        let newblock = Block()
        
        newblock.key = nil
        newblock.miner = nil
        newblock.previous = nil
        newblock.transactions = nil
        newblock.description = "Genesis Block"
        
        return newblock
    }
    
    
    //obtain latest block
    func currentBlock()-> Block {
        return chain[chain.endIndex - 1]
    }
    

    //adds block to chain
    func addBlock(_ element: Block) -> Void {
      chain.append(element)
    }

    
    //TODO: estblish new block based on provided input and the level of difficulty.
    func hashValue(_ element: Block) -> Hash? {
        
        var rawvalue = Int()
        var leadvalue = Int()

        
        //check tranactions
        guard let items = element.transactions else {
            return nil
        }
        
        
        //sum hash values
        for exchange in items {
           rawvalue = exchange.amount.hashValue
           rawvalue += exchange.from.hashValue
           rawvalue += exchange.to.hashValue
           rawvalue += exchange.lastModified.hashValue
        }

        
        //sum previous hash
        if let previous = element.previous {
            rawvalue += previous.hashValue
        }

       
        while leadvalue >= difficulty {
            
            print("mining new block..")
            let testvalue = rawvalue + String(describing: Date()).hashValue
            
            let rawlist: Array<Int> = String(testvalue).characters.flatMap{Int(String($0))}
            
            for m in 0..<rawlist.startIndex + 3 {
                leadvalue += rawlist[m]
            }
            
            //perform final bit shift and test leading values
            if (leadvalue >> 2) >= difficulty {
                return String(testvalue)
            }
            
        }
        
        return nil
    
    }

    
}
