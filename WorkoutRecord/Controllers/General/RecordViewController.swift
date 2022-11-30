//
//  RecordViewController.swift
//  WorkoutRecord
//
//  Created by 정주호 on 25/11/2022.
//

import UIKit

class RecordViewController: UIViewController {
    
    
    @IBOutlet weak var recordTableView: UITableView!
    
    let recordManager = CoreDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        setupTableView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recordTableView.reloadData()
    }
    
    func setupNaviBar() {
        self.title = "Record"
        navigationController?.navigationBar.tintColor = .white
        // 네비게이션바 우측에 Plus 버튼 만들기
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        plusButton.tintColor = .label
        navigationItem.rightBarButtonItem = plusButton
    }
    
    func setupTableView() {
        recordTableView.dataSource = self
        // 테이블뷰의 선 없애기
        recordTableView.separatorStyle = .none
    }
    
    @objc func plusButtonTapped() {
        performSegue(withIdentifier: "RecordCell", sender: nil)
    }


}

extension RecordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordManager.getToDoListFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath) as! RecordTableViewCell
        
        let recordData = recordManager.getToDoListFromCoreData()
        cell.recordData = recordData[indexPath.row]
        
        cell.updateButtonPressed = { [weak self]
            (senderCell) in
            self?.performSegue(withIdentifier: "RecordCell", sender: indexPath)
        }
        cell.selectionStyle = .none
        return cell
    }
    
}

extension RecordViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "RecordCell", sender: indexPath)
    }
    
    // (세그웨이를 실행할때) 실제 데이터 전달 (ToDoData전달)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecordCell" {
            let editVC = segue.destination as! EditingViewController
            
            guard let indexPath = sender as? IndexPath else { return }
            editVC.recordData = recordManager.getToDoListFromCoreData()[indexPath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let data = recordManager.getToDoListFromCoreData()[indexPath.row]
            tableView.beginUpdates()
            recordManager.deleteRecordData(data: data) {
                print("delete")
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        }
    }
    
    // 테이블뷰의 높이를 자동적으로 추청하도록 하는 메서드
    // (ToDo에서 메세지가 길때는 셀의 높이를 더 높게 ==> 셀의 오토레이아웃 설정도 필요)
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
