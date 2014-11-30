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
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        path = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
        audioPlayer = AVAudioPlayer(contentsOfURL: NSURL.fileURLWithPath(path), error: nil)
        audioPlayer.enableRate = true
        audioPlayer.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func stopPlaying(sender: UIButton) {
        audioPlayer.stop()
        stopButton.hidden = true

    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        stopButton.hidden = true
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
