//
//  Miner.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/1/20.
//  Copyright © 2020 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Miner: Vertex, Blockable {
  
    
  var chain = LinkedList<Block>()
  var description: String?
  
  
  override init(with name: String) {
    
      super.init()
      super.key = name.identifierWithDate(date: lastModified)
      self.description = name
  }
    
    
}
