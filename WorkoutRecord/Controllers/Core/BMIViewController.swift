//
//  BMIViewController.swift
//  WorkoutRecord
//
//  Created by 정주호 on 29/11/2022.
//

import UIKit

class BMIViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmiManager = BMICalculatorManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = "Veuillez entrer votre taille et poids"
        mainLabel.textColor = UIColor.label
        mainLabel.font = .systemFont(ofSize: 20)
        calculateButton.clipsToBounds = true
        calculateButton.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        calculateButton.layer.borderWidth = 1
        calculateButton.layer.cornerRadius = 10
        heightTextField.placeholder = "cm"
        weightTextField.placeholder = "kg"
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "Vous devez entrer votre taille et votre poids"
            mainLabel.textColor = UIColor.red
            mainLabel.font = .systemFont(ofSize: 16)
            return false
        }
        mainLabel.text = "Veuillez entrer votre taille et poids"
        mainLabel.textColor = UIColor.label
        mainLabel.font = .systemFont(ofSize: 18)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            let resultVC = segue.destination as! ResultBMIViewController
            resultVC.modalPresentationStyle = .fullScreen
            
            //비즈니스로직 담당 인스턴스에서 BMI얻어서
            let bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
            
            // (다음화면으로 데이터 전달) BMI 전달
            resultVC.bmi = bmi
        }
        // 다음화면으로 가기전에 텍스트필드 비우기
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
 
}

extension BMIViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if Int(string) != nil || string == "" {
            return true  // 글자 입력을 허용
        }
        return false  // 글자입력 허용하지 않음
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        // 두번째 텍스트필드로 넘어가도록
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}
