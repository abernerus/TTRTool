//
//  RegexHelpers.swift
//  TTRTool
//
//  Created by Andreas Bernerus on 15/09/15.
//  Copyright (c) 2015 chillturtle. All rights reserved.
//

import Foundation

extension String {
    
    func routeData() -> [String] {
        let regex = try! NSRegularExpression(pattern: "([a-z]+) \\-([0-9]{1})([rgbyopxwz]{1})> ([a-z]+)", options: [.CaseInsensitive])
        
        let match = regex.firstMatchInString(self, options: [], range: NSMakeRange(0, utf16.count));
        let startStation = (self as NSString).substringWithRange(NSRange(match!.rangeAtIndex(1).toRange()!))
        let pathLength = (self as NSString).substringWithRange(NSRange(match!.rangeAtIndex(2).toRange()!))
        let pathColor = (self as NSString).substringWithRange(NSRange(match!.rangeAtIndex(3).toRange()!))
        let endStation = (self as NSString).substringWithRange(NSRange(match!.rangeAtIndex(4).toRange()!))
        return [startStation, pathLength, pathColor, endStation]
    }
    
    func removeNewlines() -> String {
        return self.stringByReplacingOccurrencesOfString("\n", withString: "")
    }
}