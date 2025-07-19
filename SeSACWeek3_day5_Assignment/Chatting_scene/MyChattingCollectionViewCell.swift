//
//  MyChattingCollectionViewCell.swift
//  SeSACWeek3_day5_Assignment
//
//  Created by 박현진 on 7/19/25.
//

import UIKit

class MyChattingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyChattingCollectionViewCell"
    static let myName = "김새싹"

    @IBOutlet var myMessageLabel: UILabel!
    @IBOutlet var myDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .blue
        
    }
    
    func configureData(item: Chat) {
        myMessageLabel.text = item.message
        myDateLabel.text = item.date
    }

}
