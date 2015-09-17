//
// Created by Andreas Bernerus on 14/09/15.
// Copyright (c) 2015 chillturtle. All rights reserved.
//

import Foundation

class Vertex: Hashable {
    var key: String!
    
    init(key:String) {
        self.key = key
    }
    
    func equals(vertex: Vertex) -> Bool {
        return vertex.key == self.key
    }
    
    var hashValue: Int {
        return self.key.hashValue
    }
}

func ==(lhs: Vertex, rhs: Vertex) -> Bool {
    let areEqual = lhs.key == rhs.key
    return areEqual
}