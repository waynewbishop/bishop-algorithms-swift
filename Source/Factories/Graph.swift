//
//  GraphFactory.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/7/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class SwiftGraph {
   
    
    //declare a default directed graph canvas
    private var canvas: Array<Vertex>
    public var isDirected: Bool
    
    
    init() {
        canvas = Array<Vertex>()
        isDirected = true
    }
    
    
    //create a new vertex
    func addVertex(key: String) -> Vertex {
        
        
        //set the key
        let childVertex: Vertex = Vertex()
        childVertex.key = key
        
        
        //add the vertex to the graph canvas
        canvas.append(childVertex)
        
        
        return childVertex
    }
    
    
    
    //add edge to source vertex
    func addEdge(source: Vertex, neighbor: Vertex, weight: Int) {
        
        
        //create a new edge
        let newEdge = Edge()
        
        
        //establish the default properties
        newEdge.neighbor = neighbor
        newEdge.weight = weight
        source.neighbors.append(newEdge)
        
        
        print("The neighbor of vertex: \(source.key as String!) is \(neighbor.key as String!)..")
        
        
        //check condition for an undirected graph
        if isDirected == false {
            
            
           //create a new reversed edge
           let reverseEdge = Edge()
            
            
           //establish the reversed properties
           reverseEdge.neighbor = source
           reverseEdge.weight = weight
           neighbor.neighbors.append(reverseEdge)
            
           print("The neighbor of vertex: \(neighbor.key as String!) is \(source.key as String!)..")
            
        }
        
        
    }

    
    
    
    
    /* reverse the sequence of paths given the shortest path.
       process analagous to reversing a linked list. */

    func reversePath(_ head: Path!, source: Vertex) -> Path! {
        
        
        guard head != nil else {
            return head
        }
        
        //mutated copy
        var output = head
        
        
        var current: Path! = output
        var prev: Path!
        var next: Path!
        
        
        while(current != nil) {
            next = current.previous
            current.previous = prev
            prev = current
            current = next
        }
        
        
        //append the source path to the sequence
        let sourcePath: Path = Path()
        
        sourcePath.destination = source
        sourcePath.previous = prev
        sourcePath.total = nil
        
        output = sourcePath
        
        
        return output
        
    }

    
    
    
    //process Dijkstra's shortest path algorthim
    func processDijkstra(_ source: Vertex, destination: Vertex) -> Path? {
        
        
        var frontier: Array<Path> = Array<Path>()
        var finalPaths: Array<Path> = Array<Path>()
        
        
        //use source edges to create the frontier
        for e in source.neighbors {
            
            let newPath: Path = Path()
            
            
            newPath.destination = e.neighbor
            newPath.previous = nil
            newPath.total = e.weight
            
            
            //add the new path to the frontier
            frontier.append(newPath)
            
        }
        

        //construct the best path
        var bestPath: Path = Path()
        
        
        while frontier.count != 0 {
            
            //support path changes using the greedy approach
            bestPath = Path()
            var pathIndex: Int = 0

            
            for x in 0..<frontier.count {
               
                let itemPath: Path = frontier[x]
                
                if  (bestPath.total == nil) || (itemPath.total < bestPath.total) {
                    bestPath = itemPath
                    pathIndex = x
                }
                
            }
            
            
            
            //enumerate the bestPath edges
            for e in bestPath.destination.neighbors {
                
                let newPath: Path = Path()
                
                newPath.destination = e.neighbor
                newPath.previous = bestPath
                newPath.total = bestPath.total + e.weight
                
                
                //add the new path to the frontier
                frontier.append(newPath)
                
            }
            
            
            //preserve the bestPath
            finalPaths.append(bestPath)
            
            
            //remove the bestPath from the frontier
            //frontier.removeAtIndex(pathIndex) - Swift2
            frontier.remove(at: pathIndex)
            
            
            
        } //end while
        
        
    
        //establish the shortest path as an optional
        var shortestPath: Path! = Path()
        
        
        for itemPath in finalPaths {
            
            if (itemPath.destination.key == destination.key) {
                
                if  (shortestPath.total == nil) || (itemPath.total < shortestPath.total) {
                    shortestPath = itemPath
                }
                
            }
            
        }
        
        
        return shortestPath
        
    }
    
    
    
    ///an optimized version of Dijkstra's shortest path algorthim
    func processDijkstraWithHeap(_ source: Vertex, destination: Vertex) -> Path! {
        
        
        let frontier: PathHeap = PathHeap()
        let finalPaths: PathHeap = PathHeap()
        
        
        //use source edges to create the frontier
        for e in source.neighbors {
            
            let newPath: Path = Path()
            
            
            newPath.destination = e.neighbor
            newPath.previous = nil
            newPath.total = e.weight
            
            
            //add the new path to the frontier
            frontier.enQueue(newPath)
            
        }
        
        
        //construct the best path
        var bestPath: Path = Path()
        
        
        while frontier.count != 0 {
                        
            //use the greedy approach to obtain the best path
            bestPath = Path()
            bestPath = frontier.peek()
            
            
            //enumerate the bestPath edges
            for e in bestPath.destination.neighbors {
                
                let newPath: Path = Path()
                
                newPath.destination = e.neighbor
                newPath.previous = bestPath
                newPath.total = bestPath.total + e.weight
                
                
                //add the new path to the frontier
                frontier.enQueue(newPath)
                
            }
            
            
            //preserve the bestPaths that match destination
            if (bestPath.destination.key == destination.key) {
                finalPaths.enQueue(bestPath)
            }
            
            
            //remove the bestPath from the frontier
            frontier.deQueue()
            
            
        } //end while
        
        
        
        //obtain the shortest path from the heap
        var shortestPath: Path! = Path()
        shortestPath = finalPaths.peek()
        
        
        return shortestPath
        
    }
    
    
    //MARK: traversal algorithms
    
    
    //bfs traversal with inout closure function
    func traverse(_ startingv: Vertex, formula: (_ node: inout Vertex) -> ()) {

        
        //establish a new queue
        let graphQueue: Queue<Vertex> = Queue<Vertex>()
        
        
        //queue a starting vertex
        graphQueue.enQueue(startingv)
        
        
        while !graphQueue.isEmpty() {
            
            //traverse the next queued vertex
            var vitem: Vertex = graphQueue.deQueue() as Vertex!
            
            
            //add unvisited vertices to the queue
            for e in vitem.neighbors {
                if e.neighbor.visited == false {
                    print("adding vertex: \(e.neighbor.key!) to queue..")
                    graphQueue.enQueue(e.neighbor)
                }
            }
            

            /*
            notes: this demonstrates how to invoke a closure with an inout parameter.
            By passing by reference no return value is required.
            */
            
            //invoke formula
            formula(&vitem)
            
            
        } //end while
        
        
        print("graph traversal complete..")
        
        
    }

    
    
    
    //breadth first search
    func traverse(_ startingv: Vertex) {
        
        
        //establish a new queue
        let graphQueue: Queue<Vertex> = Queue<Vertex>()
        
        
        //queue a starting vertex
        graphQueue.enQueue(startingv)
        
        
        while !graphQueue.isEmpty() {
            
            //traverse the next queued vertex
            let vitem = graphQueue.deQueue() as Vertex!
            
            guard vitem != nil else {
                return
            }
            
            //add unvisited vertices to the queue
            for e in vitem!.neighbors {
                if e.neighbor.visited == false {
                    print("adding vertex: \(e.neighbor.key!) to queue..")
                    graphQueue.enQueue(e.neighbor)
                }
            }
            
            
            vitem!.visited = true
            print("traversed vertex: \(vitem!.key!)..")
            
            
        } //end while
        
        
        print("graph traversal complete..")
        
        
    } //end function
    
    
    
    //use bfs with trailing closure to update all values
    func update(startingv: Vertex, formula:((Vertex) -> Bool)) {
        
        
        //establish a new queue
        let graphQueue: Queue<Vertex> = Queue<Vertex>()
        
        
        //queue a starting vertex
        graphQueue.enQueue(startingv)
        
        
        while !graphQueue.isEmpty() {
            
            //traverse the next queued vertex
            let vitem = graphQueue.deQueue() as Vertex!            
            
            guard vitem != nil else {
                return
            }
            
            //add unvisited vertices to the queue
            for e in vitem!.neighbors {
                if e.neighbor.visited == false {
                    print("adding vertex: \(e.neighbor.key!) to queue..")
                    graphQueue.enQueue(e.neighbor)
                }
            }
            
            
            //apply formula..
            if formula(vitem!) == false {
                print("formula unable to update: \(vitem!.key)")
            }
            else {
                print("traversed vertex: \(vitem!.key!)..")
            }
            
            vitem!.visited = true
            
            
        } //end while
        
        
        print("graph traversal complete..")
        
        
    }

    

    
    
}
