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
    var audioPlayerNode: AVAudioPlayerNode!
    var path: String!
    var receivedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    var changePitchEffect: AVAudioUnitTimePitch!
    var audioFile: AVAudioFile!
    
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.fileURL, error: nil)
        
        audioPlayer.enableRate = true
        audioPlayer.delegate = self
        
        audioEngine = AVAudioEngine()
        audioPlayerNode = AVAudioPlayerNode()
        audioFile = AVAudioFile(forReading: receivedAudio.fileURL, error: nil)
        
        audioEngine.attachNode(audioPlayerNode)
        changePitchEffect = AVAudioUnitTimePitch()
        audioEngine.attachNode(changePitchEffect)
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        

    }
    
    func playAudioWithRate(rate: Float) {
        audioPlayerNode.stop()
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
        audioPlayerNode.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        changePitchEffect.pitch = pitch
        
        stopButton.hidden = false
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: {
            self.stopButton.hidden = true
        })
        
        audioEngine.startAndReturnError(nil)
        audioPlayerNode.play()
        
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioFileWithVariablePitch(1200)
    }
    
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        playAudioFileWithVariablePitch(-600)
    }
    
    @IBAction func stopPlaying(sender: UIButton) {
        audioPlayer.stop()
        audioPlayerNode.stop()
        audioEngine.stop()
        audioEngine.reset()
        stopButton.hidden = true

    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        stopButton.hidden = true
    }
    

}
