//
//  WKAlert.swift
//  WPonto
//
//  Created by Denis Nascimento on 03/07/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import WatchKit
import Foundation

class WKAlert {

   class func show( controller: WKInterfaceController, message: String) -> Void {
        controller.presentAlert(withTitle: "WPonto", message: message, preferredStyle: .alert, actions: [WKAlertAction(title: "Ok", style: .default,handler: {})])
    }
    
    class func confirm( controller: WKInterfaceController, message: String, complited: @escaping ( _ index: Int) -> ()) -> Void {
        
        controller.presentAlert(withTitle: "WPonto", message: message, preferredStyle: .alert, actions:
            [
                WKAlertAction(title: "Confirmar", style: .default, handler: {
                    complited(0)
                }),
                WKAlertAction(title: "Cancelar", style: .cancel, handler: {
                    complited(1)
                })
            ]
        )
        
    }
}
