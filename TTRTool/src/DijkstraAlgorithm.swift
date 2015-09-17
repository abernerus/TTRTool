//
//  DijkstraAlgorithm.swift
//  TTRTool
//
//  Created by Andreas Bernerus on 16/09/15.
//  Copyright © 2015 chillturtle. All rights reserved.
//

import Foundation

class DijkstraAlgorithm {
    private let nodes: [Vertex]
    
    private let edges:[Edge]
    
    private var settledNodes = Set<Vertex>()
    private var unSettledNodes = Set<Vertex>()
    private var predecessors = [Vertex: Vertex]()
    var distance = [Vertex: Int]()
    
    init(graph: Graph) {
        self.nodes = Array(graph.vertexes)
        self.edges = Array(graph.edges)
    }

    func execute(source:Vertex) {
        settledNodes = Set<Vertex>()
        unSettledNodes = Set<Vertex>()
        distance = [Vertex: Int]()
        predecessors = [Vertex: Vertex]()
        distance[source] = 0
        unSettledNodes.insert(source)
        while unSettledNodes.count > 0 {
            let node: Vertex = getMinimum(unSettledNodes)
            settledNodes.insert(node);
            unSettledNodes.remove(node);
            findMinimalDistances(node);
        }
    }

    private func getDistance(node: Vertex, target: Vertex) -> Int {
        for edge: Edge in edges {
            if (edge.source.equals(node) && edge.destination.equals(target)) {
                return edge.weight;
            }
        }
        exit(1)
    }

    private func findMinimalDistances(node: Vertex) {
        let adjacentNodes: [Vertex] = getNeighbors(node);
        for target: Vertex in adjacentNodes {
            if (getShortestDistance(target) > getShortestDistance(node) + getDistance(node, target: target)) {
                distance[target] = getShortestDistance(node) + getDistance(node, target: target);
                predecessors[target] = node;
                unSettledNodes.insert(target);
            }
        }

    }

    private func getNeighbors(node: Vertex) -> [Vertex] {
        var neighbors: [Vertex] = Array<Vertex>();
        for edge: Edge in edges {
            if (edge.source.equals(node) && !isSettled(edge.destination)) {
                neighbors.append(edge.destination);
            }
        }
        return neighbors;
    }

    private func isSettled(vertex: Vertex) -> Bool {
        return settledNodes.contains(vertex);
    }

    private func getMinimum(vertexes: Set<Vertex>) -> Vertex {
        var minimum:Vertex? = nil
        for vertex:Vertex in vertexes {
            if (minimum == nil) {
                minimum = vertex
            } else {
                if (getShortestDistance(vertex) < getShortestDistance(minimum!)) {
                    minimum = vertex
                }
            }
        }

        return minimum!;
    }

    private func getShortestDistance(destination: Vertex) -> Int {
        let d: Int? = distance[destination]
        if (d == nil) {
            return Int.max
        } else {
            return d!
        }
    }
    
    /*
    * This method returns the path from the source to the selected target and
    * NULL if no path exists
    */
    func getPath(target: Vertex) -> [Vertex]? {
        var path: [Vertex] = Array<Vertex>();
        var step: Vertex = target;
        // check if a path exists
        if (predecessors[step] == nil) {
            return nil;
        }
        path.append(step);
        while (predecessors[step] != nil) {
            step = predecessors[step]!
            path.append(step);
        }
        // Put it into the correct order
        return path.reverse();
    }
}