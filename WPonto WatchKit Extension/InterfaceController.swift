//
//  InterfaceController.swift
//  WPonto WatchKit Extension
//
//  Created by Denis Nascimento on 29/06/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    let firebase = FirebaseManager()
    
    func createUser() -> Void {
        User.signup(email: "denis.sitesrj1@gmail.com", password: "123456") { (userID) in
            debugPrint("userID: \(String(describing: userID!))")
        }
    }
    
    
    func createPoint() -> Void {
        
        Point.register { (result) in
            debugPrint("result: \(result!)")
        }
        
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
//        createUser()
        createPoint()
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
