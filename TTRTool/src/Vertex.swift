//
// Created by Andreas Bernerus on 14/09/15.
// Copyright (c) 2015 chillturtle. All rights reserved.
//

import Foundation

class Vertex {
    var key: String?
    var neighbors: Array<Edge>
    init() {
        self.neighbors = Array<Edge>()
    }
}
