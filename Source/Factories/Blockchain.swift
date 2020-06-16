//
//  Blockchain.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 06/08/20.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Blockchain {
    
    
       /*
       notes: all blockchain resources are shared by peers and miners by reference.
       any change to shared resources by either type is reflected directly the blockchain.
       */
    
     //TODO: the balance is maintained as a record on the blockchain. 
    
    
      private var intent = Array<Exchange>()
      private var blockchain = LinkedList<Block>()
      private var audit = Stack<Audit>()
 
    
      //entity types
      private var peers = Array<Peer>()
      private var miners = Array<Miner>()
      private var reward: Float = 20.0

    
    
      init() {
        self.updateChain(with: genesisBlock())
      }
    
    
    
      //MARK: peer function
    
      func newPeer(item: Peer) {
        self.peers.append(item)
      }

    
     
      //MARK: exchange functions
    
      func newExchange(_ exchange: Exchange) {
        intent.append(exchange)
      }
      
    
      func exchangeList(requester: Miner) -> Array<Exchange> {
        
         audit.push(Audit(action: "get exchange list", requester))
         return self.intent
      }
    
    
      func clearExchange(requester: Miner) {
        
        audit.push(Audit(action: "clear exchange", requester))
        intent.removeAll()
      }
    
    
      //MARK: mining functions
    
      
      //empty block
      func genesisBlock() -> Block {
        
        let newblock = Block()
        newblock.description = "genesis block.."
        
        return newblock
      }
    

    
      //return current blockchain
      func currentChain() -> LinkedList<Block> {
          return blockchain
      }
        
    
    
      //issue reward for mining block
      func sendreward(to requester: Miner) -> Float {
        
        audit.push(Audit(action: "issue reward", requester))
        return self.reward
      }
 
 
    
      //update network participants
      func updateChain(with newblock: Block) {
        
        /*
         note: all peers maintain a reference to the main network blockchain
         any change in this status is promoted to all participants
        */
        
        
        blockchain.append(newblock)
        
      }
              
        
}
