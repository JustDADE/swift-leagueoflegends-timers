//
//  ViewController.swift
//  lolbuff
//
//  Created by Vjaceslavs Hlutkovs on 08/07/14.
//  Copyright (c) 2014 Vjaceslavs Hlutkovs. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    var timersReset = [300_000,300_000,300_000,300_000,360_000,420_000]
    var timersNow = [300_000,300_000,300_000,300_000,360_000,420_000]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var ourBlueTimer: UILabel
    @IBOutlet var enemyBlueTimer: UILabel
    @IBOutlet var ourRedTimer: UILabel
    @IBOutlet var enemyRedTimer: UILabel
    @IBOutlet var dragonTimer: UILabel
    @IBOutlet var nashorTimer: UILabel

    @IBOutlet var ourBlueButton: UIButton
    @IBOutlet var enemyBlueButton: UIButton
    @IBOutlet var ourRedButton: UIButton
    @IBOutlet var enemyRedButton: UIButton
    @IBOutlet var dragonButton: UIButton
    @IBOutlet var nashorButton: UIButton
    
    
    var labels: UILabel![] { return [ourBlueTimer, enemyBlueTimer, ourRedTimer, enemyRedTimer, dragonTimer, nashorTimer] }
    var btns: UIButton![] { return [ourBlueButton, enemyBlueButton, ourRedButton, enemyRedButton, dragonButton, nashorButton] }

    @IBAction func startOurBlue(sender: AnyObject) {
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer:", userInfo: 0, repeats: true)
    }
    
    @IBAction func startEnemyBlue(sender: AnyObject) {
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer:", userInfo: 1, repeats: true)
    }
    
    @IBAction func startOurRed(sender: AnyObject) {
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer:", userInfo: 2, repeats: true)
    }
    
    @IBAction func startEnemyRed(sender: AnyObject) {
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer:", userInfo: 3, repeats: true)
    }
    
    @IBAction func startDragon(sender: AnyObject) {
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer:", userInfo: 4, repeats: true)
    }
    
    @IBAction func startNashor(sender: AnyObject) {
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimer:", userInfo: 5, repeats: true)
    }
    
    func updateTimer(sender: NSTimer) {
        var id:NSInteger = sender.userInfo as NSInteger
        btns[id].enabled = false
        if (timersNow[id] > 0) {
            var newTime = timersNow[id] - 1000
            var time = convertMstoNormal(buffMS: newTime)
            timersNow[id] = newTime
            labels[id].text = "\(time)"
        } else {
            btns[id].enabled = true
            labels[id].text = "SPAWNED"
            timersNow[id] = timersReset[id]
            sender.invalidate()
        }
    }
    
    func convertMstoNormal(#buffMS: Int) -> String {
        var minute:Int = 1_000 * 60
        
        var newMinutes:Int = buffMS / minute
        
        var newSeconds:Int = (buffMS - (newMinutes * minute)) / 1_000
        var setSeconds:String
        var temp:String
        
        if newSeconds < 10 {
            setSeconds = "0\(newSeconds)"
        } else {
            setSeconds = String(newSeconds)
        }
        
        var newTime = "\(newMinutes):\(setSeconds)"
        return newTime
    }
}

