//
//  CalendarInterfaceController.swift
//  vesta
//
//  Created by Yinglan Ma on 12/2/16.
//  Copyright © 2016 Yinglan Ma. All rights reserved.
//

import WatchKit
import Foundation


class CalendarInterfaceController: WKInterfaceController {

    @IBOutlet var calendarField: WKInterfaceButton!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        var calendar = curAlarm.event + " @"
        calendar += curAlarm.time
        calendarField.setTitle(calendar)
        
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
