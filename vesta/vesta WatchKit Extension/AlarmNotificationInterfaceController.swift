//
//  AlarmNotificationInterfaceController.swift
//  vesta
//
//  Created by Yinglan Ma on 11/22/16.
//  Copyright © 2016 Yinglan Ma. All rights reserved.
//

import WatchKit
import Foundation


class AlarmNotificationInterfaceController: WKInterfaceController {
    @IBOutlet var eventField: WKInterfaceLabel!
    @IBOutlet var timeField: WKInterfaceLabel!
    @IBOutlet var moodField: WKInterfaceLabel!
    
    @IBAction func alarmSet() {
        alarm = true
        //presentController(withName: "home", context: nil)
        WKInterfaceController.reloadRootControllers(withNames: ["home"], contexts: nil)
    }
    
    
    @IBAction func alarmCancel() {
        //presentController(withName: "home", context: nil)
        WKInterfaceController.reloadRootControllers(withNames: ["home"], contexts: nil)
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if song == 1{
            player.play()
        }
        else{
            player2.play()
        }
        playing = true
        
        let eventNotif = " Event: " + curAlarm.event
        let timeNotif = " Time:  " + curAlarm.time
        let moodNotif = " Mood: " + curAlarm.mood
        timeField.setText(timeNotif)
        eventField.setText(eventNotif)
        moodField.setText(moodNotif)
        
        
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
