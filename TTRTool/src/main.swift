//
//  main.swift
//  TTRTool
//
//  Created by Andreas Bernerus on 14/09/15.
//  Copyright (c) 2015 chillturtle. All rights reserved.
//

import Foundation


print("Hello, World!")


var mapReader = MapReader(mapName: "test");
var graph = mapReader.readMap()
var path:Path = graph.calculateShortestPath("StationA", station2: "StationC")!
print("\n\n")
print("Total length: " + String(path.totalLength))
for vertex in path.stations {
    print(vertex.key)
}