//
//  Blockchain.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Blockchain {
    
    
       /*
       notes: all blockchain resources are shared by peers and miners by reference.
       any change to shared resources by either type is reflected directly the blockchain.
       */
    
    
      private var intent = Array<Exchange>()
      private var blockchain = LinkedList<Block>()
    
      //entity types
      private var peers = Array<Peer>()
      private var miners = Array<Miner>()


    
    
      //MARK: peer function
    
      func newPeer(item: Peer) {
        self.peers.append(item)
      }

    
     
      //MARK: exchange functions
    
      func newExchange(exchange: Exchange) {
        intent.append(exchange)
      }
      
    
      func exchangeList(requester: Miner) -> Array<Exchange> {
         return self.intent
      }
    
    
    
      //MARK: mining functions
      
      func mineblock(requester: Miner) -> Block {
    
        print("mining new block..")
        
        let newblock = Block()
        return newblock
      }
      
 
    
      //return current blockchain
      func currentChain() -> LinkedList<Block> {
          return blockchain
      }
    
    
    
      func updateChain(with newblock: Block) {
        blockchain.append(newblock)
      }
          

    
      //update all participants
      func updatePeers(with newblock: Block){
        for p in peers {
            p.blockchain.append(newblock)
        }
      }
    
    
        
}
