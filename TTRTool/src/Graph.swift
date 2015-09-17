//
// Created by Andreas Bernerus on 14/09/15.
// Copyright (c) 2015 chillturtle. All rights reserved.
//

import Foundation

class Graph {
    var vertexes: Set<Vertex>!
    var edges: Set<Edge>!
    
    init(vertexes:Set<Vertex>, edges:Set<Edge>) {
        self.vertexes = vertexes
        self.edges = edges
    }
    
    func calculateShortestPath(stationName: String, station2: String) -> Path? {
        let calculator = DijkstraAlgorithm(graph: self)
        let vertex1 = findVertexByKey(stationName)
        let vertex2 = findVertexByKey(station2)
        if vertex1 != nil && vertex2 != nil {
            calculator.execute(vertex1!)
            return Path(stations: calculator.getPath(vertex2!)!, totalLength: calculator.distance[vertex2!]!)
        } else {
            print("Vertex with key: '" + stationName + "' or '" + station2 + "' not found!")
        }
        return nil
    }
    
    func findVertexByKey(key: String) -> Vertex? {
        for vertex:Vertex in vertexes {
            if vertex.key == key {
                return vertex
            }
        }
        return nil
    }
}
