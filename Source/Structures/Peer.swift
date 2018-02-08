//
//  Peer.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


 /*
 note: peers act graph vertices with their own unique characteristics.
 this includes the ability to track their network blockchain and owning public key identifier.
 */

public class Peer: Vertex {
    
   var chain: Array<Block>?
   
    
   override init(with name: String) {
       super.init()
       super.key = name.identifierWithDate(date: lastModified)
    }
    
}
