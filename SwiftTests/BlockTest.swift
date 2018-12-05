//
//  BlockTest.swift
//  SwiftTests
//
//  Created by Wayne Bishop on 2/4/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class BlockTest: XCTestCase {
    
    var bitcoin = Blockchain()
    
    var PeerA = Peer(with: "John Hobbs")    
    var PeerB = Peer(with: "Frank Smith")
    var PeerC = Peer(with: "Albert Einstien")
    var PeerD = Peer(with: "Steve Jobs")
    
    
    override func setUp() {
        super.setUp()
        
        
        //add the vertices
        bitcoin.addVertex(element: PeerA)
        bitcoin.addVertex(element: PeerB)
        bitcoin.addVertex(element: PeerC)
        bitcoin.addVertex(element: PeerD)

        
        //add the edges
        bitcoin.addEdge(source: PeerA, neighbor: PeerB, weight: 1)
        bitcoin.addEdge(source: PeerA, neighbor: PeerC, weight: 1)
        bitcoin.addEdge(source: PeerB, neighbor: PeerD, weight: 1)
        
        
        //simulate intended transactions
        PeerA.intent(with: PeerB, for: 12.95)
        PeerB.intent(with: PeerC, for: 5.00)
        PeerC.intent(with: PeerD, for: 10.00)
        PeerB.intent(with: PeerD, for: 4.95)
    }
    
    
    
    //miners monitor the peer network for intended transactions
    func testPollForExchanges() {
        
        let miner = Blockchain.Miner()
        miner.poll(startingv: PeerA, network: bitcoin)

        
        bitcoin.broadcast(to: &PeerA)
        bitcoin.broadcast(to: &PeerB)
        bitcoin.broadcast(to: &PeerC)
        bitcoin.broadcast(to: &PeerD)
        
    }
    
    
}
