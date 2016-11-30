//
//  AlarmInterfaceController.swift
//  vesta
//
//  Created by Yinglan Ma on 11/21/16.
//  Copyright © 2016 Yinglan Ma. All rights reserved.
//

import WatchKit
import Foundation


class AlarmInterfaceController: WKInterfaceController {

    @IBAction func alarmSet() {
        alarm = true
        //presentController(withName: "home", context: nil)
        WKInterfaceController.reloadRootControllers(withNames: ["home"], contexts: nil)
    }
    
    @IBAction func alarmEdit() {
        WKInterfaceController.reloadRootControllers(withNames: ["listen"], contexts: nil)
    }
    
    @IBAction func alarmCancel() {
        //presentController(withName: "home", context: nil)
        WKInterfaceController.reloadRootControllers(withNames: ["home"], contexts: nil)
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
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
