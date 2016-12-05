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
    @IBAction func addAlarm() {
        self.presentTextInputController(withSuggestions: [], allowedInputMode: WKTextInputMode.plain, completion:{
            (results) -> Void in
            let aResult = results?[0] as? String
            if(!(aResult == nil)){
                print(aResult)
                print("SHORT ASR COMPLETED")
                
                InterfaceController.parseSpeechAlarm(str: aResult!)
                
                WKInterfaceController.reloadRootControllers(withNames: ["alarm"], contexts: nil)
                //DispatchQueue.main.asynchronously() {
                // Update UI
                //}
            }//end if
        })//end show voice menu
        
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        var calendar = curAlarm.event + " @"
        calendar += curAlarm.time
        calendarField.setTitle(calendar)
        time = curAlarm.time
        event = curAlarm.event
        mood = curAlarm.mood
        
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
