//
// Created by Andreas Bernerus on 14/09/15.
// Copyright (c) 2015 chillturtle. All rights reserved.
//

import Foundation

class Path {
    var total: Int!
    var destination: Vertex
    var previous: Path!

    //object initialization
    init() {
        destination = Vertex()
    }
}
