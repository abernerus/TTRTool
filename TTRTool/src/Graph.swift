//
// Created by Andreas Bernerus on 14/09/15.
// Copyright (c) 2015 chillturtle. All rights reserved.
//

import Foundation

class Graph {
    private var canvas: Array<Vertex>
    internal var isDirected: Bool

    init() {
        canvas = Array<Vertex>()
        isDirected = true
    }

    //create a new vertex
    func addVertex(key: String) -> Vertex {
        //set the key
        var childVertex: Vertex = Vertex()
        childVertex.key = key

        //add the vertex to the graph canvas
        canvas.append(childVertex)
        return childVertex
    }

    func addEdge(source: Vertex, neighbor: Vertex, weight: Int) {
        //create a new edge
        var newEdge = Edge()

        //establish the default properties
        newEdge.neighbor = neighbor
        newEdge.weight = weight
        source.neighbors.append(newEdge)

        //check for undirected graph
        if (isDirected == false) {
            //create a new reversed edge
            var reverseEdge = Edge()
            //establish the reversed properties
            reverseEdge.neighbor = source
            reverseEdge.weight = weight
            neighbor.neighbors.append(reverseEdge)
        }
    }

    func processDijkstra(source: Vertex, destination: Vertex) -> Path? {
        var frontier: [Path] = [Path]()
        var finalPaths: [Path] = [Path]()
        //use source edges to create the frontier

        for e in source.neighbors {
            var newPath: Path = Path()
            newPath.destination = e.neighbor
            newPath.previous = nil
            newPath.total = e.weight
            //add the new path to the frontier
            frontier.append(newPath)
        }

        //construct the best path
        var bestPath: Path = Path()
        while (frontier.count != 0) {
            //support path changes using the greedy approach
            bestPath = Path()
            var x: Int = 0
            var pathIndex: Int = 0
            for (x = 0; x < frontier.count; x++) {
                var itemPath: Path = frontier[x]
                if (bestPath.total == nil) || (itemPath.total <
                        bestPath.total) {
                    bestPath = itemPath
                    pathIndex = x
                }
            }

            //enumerate the bestPath edges
            for e in bestPath.destination.neighbors {
                var newPath: Path = Path()
                newPath.destination = e.neighbor
                newPath.previous = bestPath
                newPath.total = bestPath.total + e.weight
                //add the new path to the frontier
                frontier.append(newPath)
            }
            //preserve the bestPath
            finalPaths.append(bestPath)
            //remove the bestPath from the frontier
            frontier.removeAtIndex(pathIndex)
        } //end while

        //establish the shortest path as an optional
        var shortestPath: Path! = Path()
        for itemPath in finalPaths {
            if (itemPath.destination.key == destination.key) {
                if (shortestPath.total == nil) || (itemPath.total <
                        shortestPath.total) {
                    shortestPath = itemPath
                }
            }
        }
        return shortestPath
    }

}
