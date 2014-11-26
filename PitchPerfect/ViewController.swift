//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Dmitri Orlov on 11/22/14.
//  Copyright (c) 2014 Bullet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var recordingInProgress: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //println("loaded ok from desktop")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordButton(sender: UIButton) {
        recordingInProgress.hidden = false
    }
    
    @IBAction func stopButton(sender: UIButton) {
        recordingInProgress.hidden = true
    }
}

