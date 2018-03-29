//
//  Chain.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 3/28/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


extension Blockchain {

    
    //TODO: create a computed property of hashValue to simulate bitcoin mining that
    //includes some sort of difficulty level..
    

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

    
}
