//
//  ViewController.swift
//  WorkoutRecord
//
//  Created by 정주호 on 25/11/2022.
//

import UIKit

public enum Section: Int {
    case Chest = 0
    case Back = 1
    case Sholders = 2
    case Legs = 3
    case Arms = 4
}

class ViewController: UIViewController {
    
    var isLoggedIn = false
    
    @IBOutlet weak var mainTableView: UITableView!
    let sectionTitles: [String] = ["Chest", "Back", "Shoulders", "Legs", "Arms"]
    let workoutManager = WorkoutManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLogin()
        mainTableView.dataSource = self
        mainTableView.rowHeight = 120
    }
    
    func setupLogin() {
        if !isLoggedIn {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
    }


}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as! WorkoutCell
        if indexPath.section == 0 {
            cell.mainImageView.image = workoutManager.chestData.workoutImg
            cell.workoutNameLabel.text = workoutManager.chestData.workoutName
            cell.descriptionLabel.text = workoutManager.chestData.workoutDescription
        } else if indexPath.section == 1 {
            cell.mainImageView.image = workoutManager.backData.workoutImg
            cell.workoutNameLabel.text = workoutManager.backData.workoutName
            cell.descriptionLabel.text = workoutManager.backData.workoutDescription
        } else if indexPath.section == 2 {
            cell.mainImageView.image = workoutManager.sholdersData.workoutImg
            cell.workoutNameLabel.text = workoutManager.sholdersData.workoutName
            cell.descriptionLabel.text = workoutManager.sholdersData.workoutDescription
        }  else if indexPath.section == 3 {
            cell.mainImageView.image = workoutManager.legsData.workoutImg
            cell.workoutNameLabel.text = workoutManager.legsData.workoutName
            cell.descriptionLabel.text = workoutManager.legsData.workoutDescription
        }  else if indexPath.section == 4 {
            cell.mainImageView.image = workoutManager.armsData.workoutImg
            cell.workoutNameLabel.text = workoutManager.armsData.workoutName
            cell.descriptionLabel.text = workoutManager.armsData.workoutDescription
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let hearder = view as? UITableViewHeaderFooterView else { return }
        hearder.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        hearder.textLabel?.frame = CGRect(x: hearder.bounds.origin.x + 20, y: hearder.bounds.origin.y, width: 100, height: hearder.bounds.height)
        hearder.textLabel?.textColor = .white
    }
    
}


