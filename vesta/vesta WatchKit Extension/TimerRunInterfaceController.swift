//
//  TimerRunInterfaceController.swift
//  vesta
//
//  Created by Allen on 12/6/16.
//  Copyright © 2016 Allen Zhao. All rights reserved.
//

import Foundation
import WatchKit

var choreTimer = Timer()

class TimerRunInterfaceController: WKInterfaceController {
    

    
    @IBOutlet var songsLeft: WKInterfaceLabel!
    @IBOutlet var songTimer: WKInterfaceTimer!

    let songTime = 210.0
    
    @IBAction func stopTimer() {
        choreTimer.invalidate()
        WKInterfaceController.reloadRootControllers(withNames: ["Energy Score"], contexts: nil)
    }
    
    func timerDone() {
        WKInterfaceController.reloadRootControllers(withNames: ["Energy Score"], contexts: nil)
        
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }
    override func willActivate() {
        super.willActivate()
        songsLeft.setText(String(chosen))
        let timeToAdd: TimeInterval = Double(chosen) * songTime
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
        
        musicPlayer.removeAllItems()
        playerItem = WKAudioFilePlayerItem(asset: asset)
        playerItem2 = WKAudioFilePlayerItem(asset: asset2)
        musicPlayer.appendItem(playerItem)
        musicPlayer.appendItem(playerItem2)

        musicPlayer.pause()
        playing = false
    }
    
}
