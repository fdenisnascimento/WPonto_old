//
//  ListInterfaceController.swift
//  WPonto
//
//  Created by Denis Nascimento on 04/07/17.
//  Copyright © 2017 Denis Nascimento. All rights reserved.
//

import WatchKit
import Foundation


class ListInterfaceController: WKInterfaceController {
    
    
    @IBOutlet var tableView: WKInterfaceTable!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        setupView()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func setupView() -> Void {

       tableView.setNumberOfRows(10, withRowType: "HourCell")
        
        for index in 0..<10 {
            let row = tableView.rowController(at: index ) as! HourCell
            row.labelHour.setText("index: \(index)")
        }
    }

}
