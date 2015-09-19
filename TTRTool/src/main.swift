//
//  main.swift
//  TTRTool
//
//  Created by Andreas Bernerus on 14/09/15.
//  Copyright (c) 2015 chillturtle. All rights reserved.
//

import Foundation


print("Hello, World!")



var mapReader = MapReader(mapName: Process.arguments[1]);
var graph = mapReader.readMap()

var fh = NSFileHandle.fileHandleWithStandardInput()
var data: NSData

print("Start station?")
data = fh.availableData
let startStation = String(data: data, encoding: NSUTF8StringEncoding)!.removeNewlines()

print("Start station = \(startStation)")

print("End station?")
data = fh.availableData
let endStation = String(data: data, encoding: NSUTF8StringEncoding)!.removeNewlines()
print("End station = \(endStation)")

var path:Path = graph.calculateShortestPath(startStation, station2: endStation)!
print("\n\n")
print("Total length: " + String(path.totalLength))
for vertex in path.stations {
    print(vertex.key)
}


