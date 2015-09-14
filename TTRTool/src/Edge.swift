//
// Created by Andreas Bernerus on 14/09/15.
// Copyright (c) 2015 chillturtle. All rights reserved.
//

import Foundation

class Edge {
    var neighbor: Vertex
    var weight: Int
    init() {
        weight = 0
        self.neighbor = Vertex()
    }
}
