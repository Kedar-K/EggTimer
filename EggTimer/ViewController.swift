//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime=5
    let mediunTime=7
    let hardTime=12
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
        switch hardness {
        case "Soft":
            print(softTime)
        case "Medium":
            print(mediunTime)
        case "Hard":
            print(hardTime)
        default:
            print("Error")
        }
    }
    
    
}
