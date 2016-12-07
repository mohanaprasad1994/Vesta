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


    override func willActivate() {
        super.willActivate()
        songsLeft.setText(String(chosen))
        let timeToAdd: TimeInterval = Double(chosen) * 210
        let newDateToUse = NSDate().addingTimeInterval(timeToAdd)
        songTimer.setDate(newDateToUse as Date)
        songTimer.start()
        
        var playing = false
        
        while playing == false {
            if song == 1 {
                song = 2
                player.pause()
                player2.play()
                playing = true
            }
            else {
                song = 1
                player2.pause()
                player.play()
                playing = true
            }
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        player.pause()
        player2.pause()
        playing = false
    }
    
}
