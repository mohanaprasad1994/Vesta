//
//  TimerSetupInterfaceController.swift
//  vesta
//
//  Created by stuff on 12/6/16.
//  Copyright © 2016 Yinglan Ma. All rights reserved.
//

import Foundation
import WatchKit

class TimerSetupInterfaceController: WKInterfaceController {
    
    @IBOutlet var listPicker: WKInterfacePicker!
    @IBOutlet var Timer: WKInterfaceLabel!
    
    var strList: [String] = [
        "1",
        "2",
        "3"]


    override func willActivate() {
        super.willActivate()
        let pickerItems: [WKPickerItem] = strList.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            return pickerItem
        }
        listPicker.setItems(pickerItems)
    }
    
    @IBAction func pickVal(_ value: Int) {
        Timer.setText(String((Double(value)+1) * 3.5))
    }

}
