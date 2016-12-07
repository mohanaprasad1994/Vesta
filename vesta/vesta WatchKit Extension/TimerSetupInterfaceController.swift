//
//  TimerSetupInterfaceController.swift
//  vesta
//
//  Created by Allen on 12/6/16.
//  Copyright © 2016 Allen Zhao. All rights reserved.
//

import Foundation
import WatchKit

var chosen = 1

class TimerSetupInterfaceController: WKInterfaceController {
    
    @IBOutlet var listPicker: WKInterfacePicker!
    @IBOutlet var Timer: WKInterfaceLabel!
    
    
    var strList: [String] = [
        "1",
        "2"]
    
    override func willActivate() {
        super.willActivate()
        let pickerItems: [WKPickerItem] = strList.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            return pickerItem
        }
        listPicker.setItems(pickerItems)
        listPicker.focus()
        
        chosen = 1
        choreTimer.invalidate()
    }
    
    
    @IBAction func pickVal(_ value: Int) {
        chosen = value + 1
        Timer.setText(String((Double(value)+1) * 3.5))
    }
    

}
