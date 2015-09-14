//
//  main.swift
//  TTRTool
//
//  Created by Andreas Bernerus on 14/09/15.
//  Copyright (c) 2015 chillturtle. All rights reserved.
//

import Foundation


println("Hello, World!")

var graph:Graph = Graph()
var a = graph.addVertex("A")
var b = graph.addVertex("B")
var c = graph.addVertex("C")
graph.addEdge(a, neighbor: b, weight: 2);
graph.addEdge(b, neighbor: c, weight: 2);
graph.addEdge(a, neighbor: c, weight: 5);

var path : Path? = graph.processDijkstra(a, destination: c)

println(path?.total)