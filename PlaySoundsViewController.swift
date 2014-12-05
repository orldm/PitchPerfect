//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Dmitri Orlov on 11/29/14.
//  Copyright (c) 2014 Bullet. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    var path: String!
    var receivedAudio: RecordedAudio!
    
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        path = NSBundle.mainBundle().pathForResource("01122014-234308", ofType: ".wav")
//        audioPlayer = AVAudioPlayer(contentsOfURL: NSURL.fileURLWithPath(path), error: nil)
//        audioPlayer.enableRate = true
//        audioPlayer.delegate = self
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.fileURL, error: nil)
        audioPlayer.enableRate = true
        audioPlayer.delegate = self

    }
    
    func playAudioWithRate(rate: Float) {
        audioPlayer.stop()
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        stopButton.hidden = false
    }
    
    @IBAction func playSlow(sender: UIButton) {
        playAudioWithRate(0.5)

    }

    @IBAction func playFast(sender: UIButton) {
        playAudioWithRate(2.0)

    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
    }
    
    @IBAction func stopPlaying(sender: UIButton) {
        audioPlayer.stop()
        stopButton.hidden = true

    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        stopButton.hidden = true
    }

}
