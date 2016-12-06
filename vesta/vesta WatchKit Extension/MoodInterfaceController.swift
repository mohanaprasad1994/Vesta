//
//  MoodInterfaceController.swift
//  vesta
//
//  Created by Yinglan Ma on 12/6/16.
//  Copyright © 2016 Yinglan Ma. All rights reserved.
//

import WatchKit
import Foundation


class MoodInterfaceController: WKInterfaceController {

    //@IBOutlet var moodSugField: WKInterfaceButton!
    
    @IBOutlet var emojiField: WKInterfaceButton!
    @IBOutlet var moodPicker: WKInterfacePicker!
    
    var moodList: [(String)] = [
        ("Happy"),
        ("In Love")]
    
    @IBAction func moodSelect(_ value: Int) {
        if value == 0{
            emojiField.setBackgroundImageNamed("happy.png")
        }
        else{
            emojiField.setBackgroundImageNamed("love")
        }

    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let pickerItems: [WKPickerItem] = moodList.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            return pickerItem
        }
        moodPicker.setItems(pickerItems)
        moodPicker.focus()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
