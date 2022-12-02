//
//  LoginViewController.swift
//  WorkoutRecord
//
//  Created by 정주호 on 02/12/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        // super.loadView() 필요없음
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }
    
    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    // 로그인 버튼 누르면 동작하는 함수
    @objc func loginButtonTapped() {
        // 서버랑 통신해서, 다음 화면으로 넘어가는 내용 구현
        self.dismiss(animated: true)
    }
    
    // 리셋버튼이 눌리면 동작하는 함수
    @objc func resetButtonTapped() {
        //만들기
        let alert = UIAlertController(title: "modifier le mot de passe", message: "Voulez-vous changer votre mot de passe ?", preferredStyle: .alert)
        let success = UIAlertAction(title: "Confirmer", style: .default) { action in
            print("Le bouton oui a été appuyé.")
        }
        let cancel = UIAlertAction(title: "Annuler", style: .cancel) { action in
            print("Le bouton Annuler a été appuyé.")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        // 실제 띄우기
        self.present(alert, animated: true, completion: nil)
    }
    
}
