//
//  MusicInterfaceController.swift
//  vesta
//
//  Created by Yinglan Ma on 11/21/16.
//  Copyright © 2016 Yinglan Ma. All rights reserved.
//

import WatchKit
import Foundation

//var player: WKAudioFilePlayer!
var playing = false
var song = 1

let filePath = Bundle.main.path(forResource: "song", ofType: "mp3")!
let fileUrl = NSURL.fileURL(withPath: filePath)
let asset = WKAudioFileAsset(url: fileUrl)
let playerItem = WKAudioFilePlayerItem(asset: asset)
let player = WKAudioFilePlayer(playerItem: playerItem)

let filePath2 = Bundle.main.path(forResource: "song2", ofType: "mp3")!
let fileUrl2 = NSURL.fileURL(withPath: filePath2)
let asset2 = WKAudioFileAsset(url: fileUrl2)
let playerItem2 = WKAudioFilePlayerItem(asset: asset2)
let player2 = WKAudioFilePlayer(playerItem: playerItem2)

class MusicInterfaceController: WKInterfaceController {
    

    @IBOutlet var songInfo: WKInterfaceLabel!
    @IBOutlet var artist: WKInterfaceLabel!
    @IBOutlet var playButton: WKInterfaceButton!
    //var player: WKAudioFilePlayer!
    //var playing = false
    
    @IBAction func switchSong() {
        if song == 1{
            song = 2
            player.pause()
            player2.play()
            playing = true
            songInfo.setText("Monsters")
            artist.setText("Timeflies ft Katie Sky")
        }
        else{
            song = 1
            player2.pause()
            player.play()
            playing = true
            songInfo.setText("Uptown Funk")
            artist.setText("Mark Ronson ft Bruno Mars")
        }
        
    }
    
    @IBAction func play() {
        if !playing{
            playButton.setBackgroundImageNamed("pause.png")
            if song == 1{
               player.play()
            }
            else{
               player2.play()
            }
            
            playing = true
        }
        else{
            playButton.setBackgroundImageNamed("play.png")
            if song == 1{
                player.pause()
            }
            else{
                player2.pause()
            }
            playing = false
        }
        
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if playing{
            playButton.setBackgroundImageNamed("pause.png")
        }
        else{
            playButton.setBackgroundImageNamed("play.png")
        }
        if song == 1{
            songInfo.setText("Uptown Funk")
            artist.setText("Mark Ronson ft Bruno Mars")
        }
        else{
            songInfo.setText("Monsters")
            artist.setText("Timeflies ft Katie Sky")
        }
        
        
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
