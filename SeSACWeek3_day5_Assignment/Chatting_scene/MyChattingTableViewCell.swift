//
//  MyChattingTableViewCell.swift
//  SeSACWeek3_day5_Assignment
//
//  Created by 박현진 on 7/20/25.
//

import UIKit

class MyChattingTableViewCell: UITableViewCell {
    
    static let identifier = "MyChattingTableViewCell"
    static let myName = "김새싹"

    @IBOutlet var myMessageLabel: UILabel!
    @IBOutlet var myDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .blue
    }
    
    func configureData(row: Chat) {
        myMessageLabel.text = row.message
        myDateLabel.text = row.date
    }
    
}
