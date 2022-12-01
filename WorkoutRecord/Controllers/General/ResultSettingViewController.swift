//
//  ResultSettingViewController.swift
//  WorkoutRecord
//
//  Created by 정주호 on 30/11/2022.
//


import UIKit

protocol sendDataDelegate: AnyObject {
    func mexWeight(bpText: String, dlText: String, mpText: String, sqText: String, bcText: String)
    func weightchage(bool : Bool)
}

class ResultSettingViewController: UIViewController {
    
    weak var delegate: sendDataDelegate?
    
    @IBOutlet weak var kgOrLbsSegment: UISegmentedControl!
    @IBOutlet var kgOrLbsLabels: [UILabel]!
    @IBOutlet weak var repsTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var rmResultLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
        
    @IBOutlet weak var bpTf: UITextField!
    @IBOutlet weak var dlTf: UITextField!
    @IBOutlet weak var mpTf: UITextField!
    @IBOutlet weak var sqTf: UITextField!
    @IBOutlet weak var bcTf: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
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
        self.delegate?.mexWeight(bpText: self.bpTf.text ?? "",
                                 dlText: self.dlTf.text ?? "",
                                 mpText: self.mpTf.text ?? "",
                                 sqText: self.sqTf.text ?? "",
                                 bcText: self.bcTf.text ?? "")
        
        if kgOrLbsSegment.selectedSegmentIndex == 0 {
            self.delegate?.weightchage(bool: true)
        } else if kgOrLbsSegment.selectedSegmentIndex == 1{
            self.delegate?.weightchage(bool: false)
        }

        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

}

//extension ResultSettingViewController: UITextFieldDelegate {
//
//}
