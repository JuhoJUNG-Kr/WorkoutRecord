//
//  RecordTableViewCell.swift
//  WorkoutRecord
//
//  Created by 정주호 on 25/11/2022.
//

import UIKit

class RecordTableViewCell: UITableViewCell {

    
    @IBOutlet weak var recordTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    var recordData: RecordData? {
        didSet {
            configureUIwithData()
        }
    }
    
    var updateButtonPressed: (RecordTableViewCell) -> Void = { (sender) in }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       configureUI()
    }
    
    func configureUI() {
        updateButton.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        updateButton.layer.borderWidth = 1
        updateButton.clipsToBounds = true
        updateButton.layer.cornerRadius = 10
    }
    
    func configureUIwithData() {
        recordTextLabel.text = recordData?.recordText
        dateTextLabel.text = recordData?.dateString
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    @IBAction func updateButtonTapped(_ sender: UIButton) {
        updateButtonPressed(self)
    }
    
}
