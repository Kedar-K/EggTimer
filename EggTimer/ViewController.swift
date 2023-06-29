//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    let softTime=5
    //    let mediunTime=7
    //    let hardTime=12
    
    let eggTimes = ["Soft": 30, "Medium": 40, "Hard": 70]
    var secondsPassed: Int = 0
    var timerValue: Int = 0
    var secondsRemaining: Int = 0
    var timer = Timer()
    
    
    @IBOutlet weak var resetTimerButton: UIButton!
    @IBOutlet weak var timerProgress: UILabel!
    @IBOutlet weak var timerProgressBar: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //        print(sender.titleLabel?.text ?? "No Text")
        let hardness = sender.titleLabel?.text ?? "No Text"
        //        if hardness == "Soft" {
        //            print(softTime)
        //        }else if hardness == "Medium"{
        //            print(mediunTime)
        //        }else{
        //            print(hardTime)
        //        }
        
        //Switch
        //        switch hardness {
        //        case "Soft":
        //            print(softTime)
        //        case "Medium":
        //            print(mediunTime)
        //        case "Hard":
        //            print(hardTime)
        //        default:
        //            print("Error")
        //        }
        if secondsPassed == 0 {
            timerValue = eggTimes[hardness]!
            resetTimerButton.isEnabled = true
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
            //        print(eggTimes[hardness]!)
        }
//        else if secondsPassed > 0 && sender.titleLabel?.text ?? "No Text" == hardness{
//            print("User asked to stop timer. Stopping Timer")
//            timer.invalidate()
//        }
        else{
            print("timer in progress")
        }
    }
    
    @objc func update() -> Void {
        if secondsPassed < timerValue{
            print(timerValue - secondsPassed)
            secondsRemaining = timerValue - secondsPassed
//            secondsRemaining -= 1
            secondsPassed += 1
            timerProgress.text = "\((secondsRemaining % 3600) / 60 ):\((secondsRemaining % 3600) % 60)"
            timerProgressBar.progress = Float(secondsPassed)/Float(timerValue)
        }else{
            timer.invalidate()
            timerProgress.text = "0:0"
            timerProgressBar.progress = 0.0
            secondsPassed = 0
            timerValue = 0
            secondsRemaining = 0
            resetTimerButton.isEnabled = false
            print("Done")
        }
        
    }
    
    
    @IBAction func resetTimer(_ sender: Any) {
        timer.invalidate()
        timerProgress.text = "0:0"
        timerProgressBar.progress = 0.0
        secondsPassed = 0
        timerValue = 0
        secondsRemaining = 0
        resetTimerButton.isEnabled = false
    }
    
}
