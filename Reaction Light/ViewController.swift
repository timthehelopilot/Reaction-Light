//
//  ViewController.swift
//  Reaction Light
//
//  Created by Timothy Barrett on 10/31/16.
//  Copyright © 2016 Timothy Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trafficLightImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    
    var timer = Timer()
    var scoreTimer = Timer()
    
    var timerInt = 0
    var scoreInt = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scoreInt = 0
        timeLabel.text = String(scoreInt)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        if scoreInt == 0 {
            timerInt = 3
            trafficLightImageView.image = #imageLiteral(resourceName: "TrafficLight")
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
            
            startGameButton.isEnabled = false
            startGameButton.setTitle("", for: .normal)
            
            scoreInt = 0
            timeLabel.text = String(scoreInt)
            
        } else {
            scoreTimer.invalidate()
        }
        
        if timerInt == 0 {
            scoreInt = 0
            startGameButton.setTitle("Restart", for: .normal)
        }
        
    }

    
    func updateCounter() {
        
        timerInt -= 1
        
        if timerInt == 2 {
            trafficLightImageView.image = #imageLiteral(resourceName: "TrafficLight3")
        } else if timerInt == 1 {
            trafficLightImageView.image = #imageLiteral(resourceName: "TrafficLight2")
            startGameButton.setTitle("Stop", for: .normal)
        } else if timerInt == 0 {
            trafficLightImageView.image = #imageLiteral(resourceName: "TrafficLight1")
            timer.invalidate()
            startGameButton.isEnabled = true
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(ViewController.updateScoreTitle), userInfo: nil, repeats: true)
            
            
        }
        
    }
    
    func updateScoreTitle() {
        scoreInt += 1
        timeLabel.text = String(scoreInt)
    }
    
}

