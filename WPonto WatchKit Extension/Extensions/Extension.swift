//
//  Extension.swift
//  WPonto
//
//  Created by Denis Nascimento on 01/07/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import WatchKit


extension Date: Dateable {
    
    var  formatter: DateFormatter { return DateFormatter() }
    
    func friendlyDate() -> String {
        let year = Calendar.current.component(.year, from: self)
        let month = Calendar.current.component(.month, from: self)
        let day = Calendar.current.component(.day, from: self)
        return  "\(String(format: "%02d", year))\(String(format: "%02d", month))\(String(format: "%02d", day))"
    }
    
    
    func friendlyHours() -> String {
        let hour = Calendar.current.component(.hour, from: self)
        let minute = Calendar.current.component(.minute, from: self)
        return  "\(String(format: "%02d", hour)):\(String(format: "%02d", minute))"
    }
    
    
}
