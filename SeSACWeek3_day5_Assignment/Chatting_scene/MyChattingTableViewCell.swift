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
    @IBOutlet var balloonUIView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //backgroundColor = .blue
    }
    
    func configureData(row: Chat) {
        myMessageLabel.font = .systemFont(ofSize: 12)
        myMessageLabel.textAlignment = .right
        myMessageLabel.text = row.message
        myMessageLabel.backgroundColor = .clear
        myDateLabel.font = .systemFont(ofSize: 10)
        myDateLabel.text = row.date
        balloonUIView.layer.cornerRadius = 10
        balloonUIView.layer.borderWidth = 0.5
        balloonUIView.layer.borderColor = UIColor.black.cgColor
        balloonUIView.backgroundColor = .systemGray5
        
    }
}
