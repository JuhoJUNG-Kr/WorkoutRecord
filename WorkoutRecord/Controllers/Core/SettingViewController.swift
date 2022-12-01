//
//  SettingViewController.swift
//  WorkoutRecord
//
//  Created by 정주호 on 30/11/2022.
//

import UIKit


class SettingViewController: UIViewController, sendDataDelegate {

    @IBOutlet weak var bpLabel: UILabel!
    @IBOutlet weak var dlLabel: UILabel!
    @IBOutlet weak var mpLabel: UILabel!
    @IBOutlet weak var sqLabel: UILabel!
    @IBOutlet weak var bcLabel: UILabel!
    
    @IBOutlet var kgOrLbsLabels: [UILabel]!
    
    
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

    }
    
    func mexWeight(bpText: String, dlText: String, mpText: String, sqText: String, bcText: String) {
        bpLabel.text = bpText
        dlLabel.text = dlText
        mpLabel.text = mpText
        sqLabel.text = sqText
        bcLabel.text = bcText
    }
    
    func weightchage(bool: Bool) {
        if bool == true {
            kgOrLbsLabels.forEach { $0.text = "kg" }
        } else if bool == false {
            kgOrLbsLabels.forEach { $0.text = "lbs" }
        }
    }
    
    
    func configureUI() {
        calculateButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        calculateButton.layer.borderWidth = 1
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = calculateButton.bounds.height / 2
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCalculateVC" {
            let calculateVC = segue.destination as! ResultSettingViewController
            calculateVC.delegate = self
            
            calculateVC.show(calculateVC, sender: self)
        }
    }
    

}
