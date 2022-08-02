//
//  GlobalVariables.swift
//  UserInyerface
//
//  Created by Scholar on 7/28/22.
//

import Foundation

// by putting these variables/functions inside a struct (which you can think of as a "static" Class, you can access them in all your other code files!

struct Timer {
    
    static var dateStarted = Date()
    static var calendar = Calendar.current
    
    static func start() {
        dateStarted = Date()
    }
    
    static func hours() -> Int {
        return calendar.component(.hour, from: dateStarted)
    }
    
    static func minutes() -> Int {
        return calendar.component(.minute, from: dateStarted)
    }
    
    static func seconds() -> Int {
        return calendar.component(.second, from: dateStarted)
    }
    
    static func currentTime() -> String {
        calendar = Calendar.current
        let timeDelta = Date() - dateStarted
        
        let delta = Double(String(timeDelta))
        var hours = 0
        var minutes = 0
        var seconds = delta
        if(delta! > 360.0) {
            hours = Int(delta!/360.0)
            seconds = seconds! - Double(hours*360)
        }
        if(delta! > 60.0) {
            minutes = (Int(delta!) % 360)/60
            seconds = seconds! - Double(minutes*60)
        }

        
        return("\(Double(round(10000 * delta!) / 10000)) seconds")
        
        // to format like 00:00:00 if needed :)
        //        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        
        
    }
}
