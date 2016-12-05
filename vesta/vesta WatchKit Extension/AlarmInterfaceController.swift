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

    @IBOutlet var timeField: WKInterfaceButton!
    @IBOutlet var eventField: WKInterfaceButton!
    @IBOutlet var moodField: WKInterfaceButton!
    
    @IBAction func alarmSet() {
        alarm = true
        curAlarm = Alarm(time:time, event:event, mood:mood)
        //presentController(withName: "home", context: nil)
        WKInterfaceController.reloadRootControllers(withNames: ["home"], contexts: nil)
    }
    
    @IBAction func alarmEdit() {
        //WKInterfaceController.reloadRootControllers(withNames: ["listen"], contexts: nil)
        self.presentTextInputController(withSuggestions: [], allowedInputMode: WKTextInputMode.plain, completion:{
            (results) -> Void in
            let aResult = results?[0] as? String
            if(!(aResult == nil)){
                
                InterfaceController.parseSpeechAlarm(str: aResult!)
                self.timeField.setTitle(time)
                self.eventField.setTitle(event)
                self.moodField.setTitle(mood)
                
                //DispatchQueue.main.asynchronously() {
                // Update UI
                //}
            }//end if
        })//end show voice menu

    }
    
    @IBAction func alarmCancel() {
        //presentController(withName: "home", context: nil)
        WKInterfaceController.reloadRootControllers(withNames: ["home"], contexts: nil)
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        timeField.setTitle(time)
        eventField.setTitle(event)
        moodField.setTitle(mood)
        
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
