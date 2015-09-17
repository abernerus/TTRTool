//
// Created by Andreas Bernerus on 14/09/15.
// Copyright (c) 2015 chillturtle. All rights reserved.
//

import Foundation

class Edge : Hashable {
    var id:String
    var source:Vertex
    var destination:Vertex
    var weight = 0
    
    init(id:String, source: Vertex, destination:Vertex, weight:Int) {
        self.id = id
        self.source = source
        self.destination = destination
        self.weight = weight
    }
    
    func toString() -> String {
        return source.key + " " + destination.key
    }
    
    var hashValue: Int {
        return self.id.hashValue
    }
}

func ==(lhs: Edge, rhs: Edge) -> Bool {
    let stationsEquals = (lhs.source == rhs.source && lhs.destination == rhs.destination) || (lhs.source == rhs.destination && lhs.destination == rhs.source)
    return stationsEquals
}