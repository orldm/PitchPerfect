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
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
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
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.fileURL, error: nil)

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
    
    func playAudioFileWithVariablePitch(pitch: Float) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        audioPlayerNode.play()
        stopButton.hidden = false
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioFileWithVariablePitch(1200)
    }
    
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        playAudioFileWithVariablePitch(-600)
    }
    
    @IBAction func stopPlaying(sender: UIButton) {
        audioPlayer.stop()
        stopButton.hidden = true

    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        stopButton.hidden = true
    }

}
