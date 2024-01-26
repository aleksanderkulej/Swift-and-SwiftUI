//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
           super.viewDidLoad()
           
           // Call setupAudioPlayer to initialize the audio player
           setupAudioPlayer()
       }

    let eggTimes = ["Soft": 5, "Medium": 8, "Hard": 12]
    var countdownTimer: Timer?
    var totalTime = 0
    var secondsPast = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        stopCountdown()
        let hardness = sender.currentTitle!
        
        if let hardness = sender.currentTitle {
            if let totalTime = eggTimes[hardness] {
                startCountdown(minutes: totalTime * 60) // Convert minutes to seconds
            }
        }
        progressBar.progress = 0
        secondsPast=0
        titleLabel.text = hardness
    }

    func startCountdown(minutes: Int) {
        totalTime = minutes
      
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        if secondsPast < totalTime {
            
            secondsPast += 1

            progressBar.progress = Float(secondsPast) / Float(totalTime)
            
            
            
            
        } else {
            stopCountdown()
            titleLabel.text = "Done!"
            audioPlayer?.play()
        }
    }

    func stopCountdown() {
        countdownTimer?.invalidate()
        countdownTimer = nil
    }
    
    func setupAudioPlayer() {
            guard let soundURL = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else {
                return
            }

            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error initializing audio player: \(error.localizedDescription)")
            }
        }

   
}
