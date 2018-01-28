//
//  KMLogger.swift
//  KMNetworkOperation
//
//  Created by Jha, Krishna on 1/25/18.
//  Copyright © 2018 Jha, Krishna. All rights reserved.
//

import UIKit
enum LoggerEvent: String {
    case e = "[‼️]" // error
    case i = "[ℹ️]" // info
    case d = "[💬]" // debug
    case v = "[🔬]" // verbose
    case w = "[⚠️]" // warning
    case s = "[🔥]" // severe
    
}

class KMLogger {
    
    var isLoggerEnable = true
  static  let shareInstance = KMLogger()
  
    
    static var dateFormat = "yyyy-MM-dd hh:mm:ss"
    
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
    
    class func log(message: Any,event: LoggerEvent = .d,fileName: String = #file,
        line: Int = #line,column: Int = #column,funcName: String = #function)
    {
        if KMLogger.shareInstance.isLoggerEnable
        {
            print("\(Date().toString()) \(event.rawValue)[\(sourceFileName(filePath: fileName))]:\(line) \(column) \(funcName) -> \(message)")
        }
}
}
extension Date {
    func toString() -> String {
        return KMLogger.dateFormatter.string(from: self as Date)
    }
}
