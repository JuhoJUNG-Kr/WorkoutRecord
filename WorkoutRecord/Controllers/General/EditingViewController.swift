//
//  EditingViewController.swift
//  WorkoutRecord
//
//  Created by 정주호 on 25/11/2022.
//

import UIKit

class EditingViewController: UIViewController {
    
    @IBOutlet weak var chestButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var shoulderButton: UIButton!
    
    @IBOutlet weak var legButton: UIButton!
    
    @IBOutlet weak var armButton: UIButton!
    
    
    @IBOutlet weak var mainTextField: UITextView!
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    let recordManager = CoreDataManager.shared
    var recordData: RecordData?
    
    lazy var buttons: [UIButton] = {
        return [chestButton, backButton, shoulderButton, legButton, armButton]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setup()
    }
    
    func setup() {
        mainTextField.delegate = self
    }
    
    func configureUI() {
        // 기존데이터가 있을때
        if let recordData = self.recordData {
            self.title = "Edit"
            
            guard let text = recordData.recordText else { return }
            mainTextField.text = text
            mainTextField.textColor = .label
            saveButton.setTitle("UPDATE", for: .normal)
            mainTextField.becomeFirstResponder()
            
        // 기존데이터가 없을때
        } else {
            self.title = "New Record"
            
            mainTextField.text = "Text here"
            mainTextField.textColor = .label
            saveButton.setTitle("Save", for: .normal)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainTextField.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        mainTextField.layer.borderWidth = 1
        mainTextField.clipsToBounds = true
        
        saveButton.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        saveButton.layer.borderWidth = 1
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 8
        
        buttons.forEach { button in
            button.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            button.layer.borderWidth = 1
            button.clipsToBounds = true
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
    
    @IBAction func chestButtonTapped(_ sender: UIButton) {
        mainTextField.text = """
 Chest
 Bench Press
 1set:
 2set:
 3set:
 4set:
 5set:
 6set:
 7set:
 8set:
 9set:
 10set:
 """
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        mainTextField.text = """
 Back
 Dead Lift
 1set:
 2set:
 3set:
 4set:
 Barbell Row
 5set:
 6set:
 7set:
 Pull Down
 8set:
 9set:
 10set:
 """
    }
    
    @IBAction func shoulderButtonPressed(_ sender: UIButton) {
        mainTextField.text = """
 Shoulder
 Military Press
 1set:
 2set:
 3set:
 4set:
 5set:
 6set:
 7set:
 8set:
 9set:
 10set:
 """
    }
    
    @IBAction func legButtonPressed(_ sender: UIButton) {
        mainTextField.text = """
 Leg
 Squat
 1set:
 2set:
 3set:
 4set:
 5set:
 6set:
 7set:
 8set:
 9set:
 10set:
 """
    }
    
    @IBAction func armButtonPressed(_ sender: UIButton) {
        mainTextField.text = """
 Biceps
 Barbell Curl
 1set:
 2set:
 3set:
 4set:
 5set:
 triceps
 6set:
 7set:
 8set:
 9set:
 10set:
 """
    }
    
    
    
    

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // 기존데이터가 있을때 ===> 기존 데이터 업데이트
        if let recordData = self.recordData {
            // 텍스트뷰에 저장되어 있는 메세지
            recordData.recordText = mainTextField.text
            recordManager.updateRecordData(newRecodeData: recordData) {
                self.navigationController?.popViewController(animated: true)

            }
            
        // 기존데이터가 없을때 ===> 새로운 데이터 생성
        } else {
            let recordText = mainTextField.text
            recordManager.saveRecordData(recordText: recordText) {
                self.navigationController?.popViewController(animated: true)


            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

extension EditingViewController: UITextViewDelegate {
    // 입력을 시작할때
    // (텍스트뷰는 플레이스홀더가 따로 있지 않아서, 플레이스 홀더처럼 동작하도록 직접 구현)
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Text here" {
            textView.text = nil
            textView.textColor = .label
        }
    }
    
    // 입력이 끝났을때
    func textViewDidEndEditing(_ textView: UITextView) {
        // 비어있으면 다시 플레이스 홀더처럼 입력하기 위해서 조건 확인
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "Text here"
            textView.textColor = .lightGray
        }
    }
}
