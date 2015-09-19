//
//  MapReader.swift
//  TTRTool
//
//  Created by Andreas Bernerus on 14/09/15.
//  Copyright (c) 2015 chillturtle. All rights reserved.
//

import Foundation

class MapReader {
    let content:String
    
    init(mapName:String) {
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("test", ofType: "map", inDirectory: "resources")
        content = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
    }
    
    func readMap() -> Graph {
        let myStringArr = content.componentsSeparatedByString("\n")
        
        var vertexes = Set<Vertex>()
        var edges = Set<Edge>()
        
        for route in myStringArr {
            print(route)
            let routeData = route.routeData()
            print("start="+routeData[0])
            print("length="+routeData[1])
            print("color="+routeData[2])
            print("end="+routeData[3])
            
            let a = Vertex(key: routeData[0])
            let b = Vertex(key: routeData[3])
            
            let e = Edge(id: route, source: a, destination: b, weight: Int(routeData[1])!)
            let e2 = Edge(id: route+"back", source: b, destination: a, weight: Int(routeData[1])!)
            
            vertexes.insert(a)
            vertexes.insert(b)
            edges.insert(e)
            edges.insert(e2)
        }
        
        return Graph(vertexes: vertexes, edges: edges)
    }
    
}