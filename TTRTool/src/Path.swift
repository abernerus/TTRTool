//
//  Path.swift
//  TTRTool
//
//  Created by Andreas Bernerus on 17/09/15.
//  Copyright © 2015 chillturtle. All rights reserved.
//

import Foundation

class Path {
    let stations:[Vertex]
    let totalLength:Int
    
    init(stations:[Vertex], totalLength:Int){
        self.stations = stations
        self.totalLength = totalLength
    }
}