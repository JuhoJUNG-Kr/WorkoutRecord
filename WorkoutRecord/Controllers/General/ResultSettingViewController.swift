//
//  ResultSettingViewController.swift
//  WorkoutRecord
//
//  Created by 정주호 on 30/11/2022.
//


import UIKit


class ResultSettingViewController: UIViewController {
    
    @IBOutlet weak var kgOrLbsSegment: UISegmentedControl!
    
    @IBOutlet var kgOrLbsLabels: [UILabel]!
    
    @IBOutlet weak var repsTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var rmResultLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var viewTopConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repsTextField.delegate = self
        weightTextField.delegate = self
    }
    
    func configureUI() {
        saveButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        saveButton.layer.borderWidth = 1
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = saveButton.bounds.height / 2
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch kgOrLbsSegment.selectedSegmentIndex {
        case 0: kgOrLbsLabels.forEach { $0.text = "kg" }
        case 1: kgOrLbsLabels.forEach { $0.text = "lbs" }
        default:
            break
        }
    }
    


    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

}

extension ResultSettingViewController: UITextFieldDelegate {
    
}
