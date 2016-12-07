//
//  TimerRunInterfaceController.swift
//  vesta
//
//  Created by Allen on 12/6/16.
//  Copyright © 2016 Allen Zhao. All rights reserved.
//

import Foundation
import WatchKit


class TimerRunInterfaceController: WKInterfaceController {
    

    
    @IBOutlet var songsLeft: WKInterfaceLabel!
    @IBOutlet var songTimer: WKInterfaceTimer!

    var choreTimer = Timer()
    
    @IBAction func stopTimer() {
        choreTimer.invalidate()
        WKInterfaceController.reloadRootControllers(withNames: ["Energy Score"], contexts: nil)
    }
    
    func timerDone() {
        WKInterfaceController.reloadRootControllers(withNames: ["Energy Score"], contexts: nil)
        
    }

    override func willActivate() {
        super.willActivate()
        songsLeft.setText(String(chosen))
        let timeToAdd: TimeInterval = Double(chosen) * 210
        let newDateToUse = NSDate().addingTimeInterval(timeToAdd)
        songTimer.setDate(newDateToUse as Date)
        songTimer.start()
        
        if choreTimer.isValid{choreTimer.invalidate()}
        choreTimer = Timer.scheduledTimer(timeInterval: timeToAdd, target: self, selector: (#selector(TimerRunInterfaceController.timerDone)), userInfo: nil, repeats: false)
        
        musicPlayer.play()
        playing = true
        
        }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        musicPlayer.pause()
        playing = false
    }
    
}
