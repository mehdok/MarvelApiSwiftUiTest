//
//  Log.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import Foundation

enum LogEvent: String {
    case e = "[❗️❗️]" // error
    case i = "[❕❕]" // info
    case d = "[👀👀]" // debug
    case v = "[🔬🔬]" // verbose
    case w = "[⚠️⚠️]" // warning
    case s = "[🔥🔥]" // severe
}

public class Log {
    static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }

    class func print(_ object: Any) {
        // Only allowing in DEBUG mode
        #if DEBUG
            Swift.print(object)
        #endif
    }

    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }

    //    publics

    public class func e(_ object: Any,
                        filename: String = #file,
                        line: Int = #line,
                        column: Int = #column,
                        funcName: String = #function) {
        print("\(Date().toString()) \(LogEvent.e.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
    }

    public class func i(_ object: Any,
                        filename: String = #file,
                        line: Int = #line,
                        column: Int = #column,
                        funcName: String = #function) {
        print("\(Date().toString()) \(LogEvent.i.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
    }

    public class func d(_ object: Any,
                        filename: String = #file,
                        line: Int = #line,
                        column: Int = #column,
                        funcName: String = #function) {
        print("\(Date().toString()) \(LogEvent.d.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
    }

    public class func v(_ object: Any,
                        filename: String = #file,
                        line: Int = #line,
                        column: Int = #column,
                        funcName: String = #function) {
        print("\(Date().toString()) \(LogEvent.v.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
    }

    public class func w(_ object: Any,
                        filename: String = #file,
                        line: Int = #line,
                        column: Int = #column,
                        funcName: String = #function) {
        print("\(Date().toString()) \(LogEvent.w.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
    }

    public class func s(_ object: Any,
                        filename: String = #file,
                        line: Int = #line,
                        column: Int = #column,
                        funcName: String = #function) {
        print("\(Date().toString()) \(LogEvent.s.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
    }
}

extension Date {
    func toString() -> String {
        return Log.dateFormatter.string(from: self as Date)
    }
}
