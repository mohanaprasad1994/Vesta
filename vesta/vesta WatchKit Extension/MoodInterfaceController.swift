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

    @IBOutlet var moodSugField: WKInterfaceButton!
    
    @IBOutlet var emojiField: WKInterfaceButton!
    
    @IBAction func editMood() {
        self.presentTextInputController(withSuggestions: [], allowedInputMode: WKTextInputMode.plain, completion:{
            (results) -> Void in
            let aResult = results?[0] as? String
            if(!(aResult == nil)){
                print(aResult)
                print("SHORT ASR COMPLETED")
                
                self.parseMood(str: aResult!)
                //DispatchQueue.main.asynchronously() {
                // Update UI
                //}
            }//end if
        })//end show voice menu

        
    }
    
    func parseMood(str: String){
        let strArr = str.characters.split{$0 == " "}.map(String.init)
        for (idx, elem) in strArr.enumerated() {
            var elem_lo = elem.lowercased()
            if elem_lo == "happy"{
                emojiField.setBackgroundImageNamed("happy.png")
                moodSugField.setTitle("Happy")
            }
            if elem_lo == "love" || elem_lo == "romantic"{
                emojiField.setBackgroundImageNamed("love.png")
                moodSugField.setTitle("In Love")
            }
            
        }

    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
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
