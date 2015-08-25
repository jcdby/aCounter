//
//  ViewController.swift
//  ACounter
//
//  Created by 李金橙 on 15/8/9.
//  Copyright (c) 2015年 李金橙. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonFor5: UIButton!
    @IBOutlet weak var buttonFor3: UIButton!
    @IBOutlet weak var buttonFor1: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var buttonReset: UIButton!
    
    
    var timer : NSTimer?
    var isCounting : Bool = false{
        willSet {
            if newValue{
                timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTime:" , userInfo: nil, repeats: true)
            }
            else{
                timer?.invalidate()
               
            }
            
           
            
        }
    }
    
    var buttonsEnable : Bool = true {
        willSet{
            if newValue
            {
                buttonFor5.enabled = true
                buttonFor5.alpha = 1
                buttonFor3.enabled = true
                buttonFor3.alpha = 1
                buttonFor1.enabled = true
                buttonFor1.alpha = 1
                buttonReset.enabled = true
                buttonReset.alpha = 1
            }
            else {
                buttonFor5.enabled = false
                buttonFor5.alpha = 0.3
                buttonFor3.enabled = false
                buttonFor3.alpha = 0.3
                buttonFor1.enabled = false
                buttonFor1.alpha = 0.3
                buttonReset.enabled = false
                buttonReset.alpha = 0.3
        }
        }
    }
  
    var isIntialState : Bool = true{
        willSet{
            if newValue{
                startButton.enabled = false
                startButton.alpha = 0.3
            }
            else{
                startButton.enabled = true
                startButton.alpha = 1
            }
        }
    }
    
    var remaindSeconds : Int = 0 {
        willSet(newValue){
            let min = newValue / 60
            let sec = newValue % 60
            
            display.text = NSString(format: "%02d:%02d", min, sec) as String
           
            
        }
    }
    
    
    @IBAction func setMunite(sender: UIButton) {
        if let munite = sender.currentTitle{
        switch munite{
            case "5分":
                remaindSeconds += 300
            case "3分":
                remaindSeconds += 180
            case "10秒":
                remaindSeconds += 10
            default:
                println("Error")
        }
        
        isIntialState = false
        }
        
    }
    
    @IBAction func resetMinute(sender: UIButton) {
        remaindSeconds = 0
        isIntialState = true
    }
    
    @IBAction func startStopButtonClicked(sender: UIButton) {
        isCounting = !isCounting
        buttonsEnable = !buttonsEnable
        
    }
    
    func updateTime(sender : NSTimer){
        remaindSeconds -= 1
        
        if remaindSeconds <= 0{
            let alert = UIAlertView()
            alert.title = "计时完成！"
            alert.message = ""
            alert.addButtonWithTitle("OK")
            alert.show()
            isCounting = false
            isIntialState = true
            buttonsEnable = !buttonsEnable
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        isIntialState = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

