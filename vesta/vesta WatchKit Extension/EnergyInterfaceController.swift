//
//  EnergyInterfaceController.swift
//  vesta
//
//  Created by Yinglan Ma on 12/7/16.
//  Copyright © 2016 Yinglan Ma. All rights reserved.
//

import WatchKit
import Foundation


class EnergyInterfaceController: WKInterfaceController {

    @IBAction func energyDone() {
        WKInterfaceController.reloadRootControllers(withNames: ["home"], contexts: nil)
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        WKInterfaceDevice.current().play(WKHapticType.notification)
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
