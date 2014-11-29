//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Dmitri Orlov on 11/29/14.
//  Copyright (c) 2014 Bullet. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlow(sender: UIButton) {
        
        let path = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") as String!
        audioPlayer = AVAudioPlayer(contentsOfURL: NSURL.fileURLWithPath(path), error: nil)
        audioPlayer.play()
        audioPlayer.updateMeters()
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
