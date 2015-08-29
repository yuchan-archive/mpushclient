//
//  HBOLogger.swift
//  mpushclient
//
//  Created by Ohashi Yusuke on 8/29/15.
//  Copyright © 2015 Ohashi Yusuke. All rights reserved.
//

import UIKit

class HBOLogger: NSObject {
    class func Debug(str: String) {
        WriteLog(str, level: "Debug")
    }
    class func Info(str: String) {
        WriteLog(str, level: "Info")
    }
    
    class func Error(str: String) {
        WriteLog(str, level: "Error")
    }

    class func Warn(str: String) {
        WriteLog(str, level: "Warning")
    }
    
    private class func WriteLog(str:String, level: String) {
        print("[\(level)]: \(str)")
    }
    
}
