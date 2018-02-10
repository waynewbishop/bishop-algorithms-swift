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
        bitcoin.addEdge(source: PeerB, neighbor: PeerC, weight: 1)
        bitcoin.addEdge(source: PeerB, neighbor: PeerD, weight: 1)
        
        //TODO: Peers publish intended transactions which are sent to miners..
    }
    
    
    //simulate the intended tranactions
    func testExchanges() {
        
        let miner = Blockchain.Miner()
       // miner.queueExchange(from: PeerA, to: PeerB, amount: 12.95, network: bitcoin)
        
    }
    
}
