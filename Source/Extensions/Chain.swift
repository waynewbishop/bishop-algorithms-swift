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
        
        /*
        not required as all these properties are optional..
        newblock.key = nil
        newblock.miner = nil
        newblock.previous = nil
        newblock.transactions = nil
        */
        
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

    
    func puzzle(newBlock: Block) -> Hash? {
    
     return nil
        
        //takes the value, converts it to a string array, send the 4 leading characters "array slice" to the closure, have it
        //calculate the result. The closure results determines of the puzzle should repeat. 
        
        //the new hash is just a combination of the previous hash combined with the hash of the
        //previous transactions along with the date..
        
    }

    
}
