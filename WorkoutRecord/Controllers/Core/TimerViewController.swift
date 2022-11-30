//
//  TimerViewController.swift
//  WorkoutRecord
//
//  Created by 정주호 on 29/11/2022.
//

import UIKit

class TimerViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var number = 0
    var timer: Timer?
    var timerCounting: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    func configureUI() {
        resetButton.layer.borderColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        resetButton.layer.borderWidth = 1
        resetButton.clipsToBounds = true
        resetButton.layer.cornerRadius = resetButton.bounds.height / 2
        
        startButton.layer.borderColor = #colorLiteral(red: 0.1882352941, green: 0.8333189526, blue: 0.5780377776, alpha: 1)
        startButton.layer.borderWidth = 1
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = startButton.bounds.height / 2
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        self.number = 0
        self.timer?.invalidate()
        self.mainLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
        self.startButton.setTitle("START", for: .normal)
        self.startButton.layer.borderColor = #colorLiteral(red: 0.1882352941, green: 0.8333189526, blue: 0.5780377776, alpha: 1)
    }
    
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        if timerCounting {
            timerCounting = false
            timer?.invalidate()
            startButton.setTitle("START", for: .normal)
            startButton.layer.borderColor = #colorLiteral(red: 0.1882352941, green: 0.8333189526, blue: 0.5780377776, alpha: 1)
        } else {
            timerCounting = true
            startButton.setTitle("STOP", for: .normal)
            startButton.layer.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerCounter() -> Void {
        number = number + 1
        let time = calculateSeconds(seconds: number)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        mainLabel.text = timeString
    }
    
    func calculateSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
}
