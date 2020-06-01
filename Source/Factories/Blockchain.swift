//
//  Blockchain.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Blockchain: Graph {
    
    var chain =  LinkedList<Block>()
    var queue = Queue<Exchange>()
    var threshold: Int


    init(threshold: Int = 3) {
        
      self.threshold = threshold
      super.init(directed: false)
        
      chain.append(startingBlock())
        
    }
    
    
    
    
//MARK: block functions

    
    //starting block
    private func startingBlock()-> Block {
        
        let first = Block()
        
        first.hash = mineBlock()
        first.description = "genesis block"
        return first
    }
    

    
    //generate block identifier (e.g. potential mining operation..)
    private func mineBlock() -> String {
        return UUID().uuidString
    }

    
    //TODO: the network polls for pending exchanges 

    
    //TODO: broadcast latest block to peers to be done via BFS traversal.
        
}
