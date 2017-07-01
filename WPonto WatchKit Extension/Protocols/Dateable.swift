//
//  Dateable.swift
//  WPonto
//
//  Created by Denis Nascimento on 01/07/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import WatchKit

protocol Dateable {
    func friendlyDate() -> String
    func friendlyHours() -> String
}
