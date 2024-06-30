//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var label: UILabel!
    let dict: [String: Int] = ["Soft": 3, "Medium": 5, "Hard": 7]
    var initialTime = 0
    
    var time = 0
    var timer = Timer()
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        time = dict[hardness]!
        initialTime = time
        timer.invalidate()
        progressBar.progress = 0.0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer() {
        if time <= 0 {
            timer.invalidate()
            label.text = "Done!"
        }
        progressBar.progress = 1.0 - Float(time) / Float(initialTime)
        print("Time remaining: \(time)")
        time -= 1
    }
}




