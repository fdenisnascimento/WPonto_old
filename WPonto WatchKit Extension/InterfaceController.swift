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
    
    @IBOutlet var btnRegister: WKInterfaceButton!
    
    @IBAction func goToRegister() {
        
        WKAlert.confirm(controller: self, message: "Confirma?") { (result) in
            if result == 0 {
                self.btnRegister.setTitle("Registrando...")
                self.btnRegister.setEnabled(false)
                self.createPoint()
            }
        }
    }
    
    
    func createUser() -> Void {
        User.signup(email: "denis.sitesrj1@gmail.com", password: "123456") { (userID) in
            debugPrint("userID: \(String(describing: userID!))")
        }
    }
    
    
    func createPoint() -> Void {
        
        Point.register { (created) in
            if created {
                WKAlert.show(controller: self, message: "Marcação registrada com sucesso")
            }else{
                WKAlert.show(controller: self, message: "Não foi possível efetuar a marcação")
            }
            self.btnRegister.setEnabled(true)
            self.btnRegister.setTitle("Marcar ponto")
        }
        
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        //        createUser()
        //        createPoint()
        
        Point.retrieveDayPointsFromUser(day: 3) { (result) in
            debugPrint("day:\(String(describing: result))")
        }
        
        //        Point.retrieveMonthPointsFromUser(month: 07) { (result) in
        //            debugPrint("month:\(String(describing: result))")
        //        }
        //
        //        Point.retrieveYearPointsFromUser(year: 2017) { (result) in
        //               debugPrint("year:\(String(describing: result))")
        //        }
        //
        //        Point.retrieveAllPointsFromUser { (result) in
        //            debugPrint("all:\(String(describing: result))")
        //        }
        
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
