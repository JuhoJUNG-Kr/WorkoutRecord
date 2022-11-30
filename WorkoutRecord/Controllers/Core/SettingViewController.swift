//
//  SettingViewController.swift
//  WorkoutRecord
//
//  Created by 정주호 on 30/11/2022.
//

import UIKit

class SettingViewController: UIViewController {
    
    
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

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
            calculateVC.show(calculateVC, sender: self)
        }
    }
    

}
