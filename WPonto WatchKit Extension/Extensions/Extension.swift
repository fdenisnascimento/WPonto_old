//
//  Extension.swift
//  WPonto
//
//  Created by Denis Nascimento on 01/07/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import WatchKit


extension Date {
    
    var  formatter: DateFormatter { return DateFormatter() }
    
    func friendlyDate() -> String {
        let year = Calendar.current.component(.year, from: self)
        let month = Calendar.current.component(.month, from: self)
        let day = Calendar.current.component(.day, from: self)
        return  "\(year)\(String(format: "%02d", month))\(String(format: "%02d", day))"
    }
    
    
    func friendlyHours() -> String {
        let hour = Calendar.current.component(.hour, from: self)
        let minute = Calendar.current.component(.minute, from: self)
        return  "\(String(format: "%02d", hour)):\(String(format: "%02d", minute))"
    }
    
    func year() -> String {
        return  String(Calendar.current.component(.year, from: self))
    }
    
    func month() -> String {
        return  String(format:"%02d", Calendar.current.component(.month, from: self))
    }

    func day() -> String {
        return  String(format:"%02d", Calendar.current.component(.day, from: self))
    }

    
    
}
