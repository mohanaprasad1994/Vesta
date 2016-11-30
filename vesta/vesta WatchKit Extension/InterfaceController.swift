//
//  InterfaceController.swift
//  vesta WatchKit Extension
//
//  Created by Yinglan Ma on 11/20/16.
//  Copyright © 2016 Yinglan Ma. All rights reserved.
//

import WatchKit
import Foundation


var alarm = false
var intervalTimer = Timer()

class InterfaceController: WKInterfaceController {

    @IBAction func info() {
        presentController(withName: "info", context: nil)
        
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        if alarm{
        //timer for notification
            let interval:TimeInterval = 5.0
            if intervalTimer.isValid{intervalTimer.invalidate()} //shut off timer if on
            intervalTimer = Timer.scheduledTimer(timeInterval: interval ,
                                             target: self,  //Object to target when done
            selector: #selector(self.timerDidEnd(timer:)), //Method on the object
            userInfo: nil, //Extra user info, most likely a dictionary
            repeats: false) //Repeat of not
        }

        // Configure interface objects here.
    }
    
    func timerDidEnd(timer:Timer){
        alarm = false
        //presentController(withName: "alarmNotification", context: nil)
        WKInterfaceController.reloadRootControllers(withNames: ["alarmNotification"], contexts: nil)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        player.pause()
        player2.pause()
        playing = false
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
