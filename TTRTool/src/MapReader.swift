//
//  MapReader.swift
//  TTRTool
//
//  Created by Andreas Bernerus on 14/09/15.
//  Copyright (c) 2015 chillturtle. All rights reserved.
//

import Foundation

class MapReader {
    
    init(mapName:String) {
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("test", ofType: "map", inDirectory: "resources")
        let content = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)!
        
        var myStringArr = content.componentsSeparatedByString("\n")
        
        for route in myStringArr {
            println(route)
            let nsString = route as NSString
            
            let regex = NSRegularExpression(pattern: "([A-Za-z]+) \\-([0-9]{1})([rgbyopxwz]{1}) ([A-Za-z]+)", options: nil, error: nil)
            let results = regex!.matchesInString(route, options: nil, range: NSMakeRange(0, nsString.length)) as! [NSTextCheckingResult]
            map(results) {
                println(nsString.substringWithRange(route.substringWithRange($0.range)))
            }
            
        }
    }
    
}