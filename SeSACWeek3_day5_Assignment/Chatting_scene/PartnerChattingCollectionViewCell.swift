//
//  PartnerChattingCollectionViewCell.swift
//  SeSACWeek3_day5_Assignment
//
//  Created by 박현진 on 7/19/25.
//

import UIKit

class PartnerChattingCollectionViewCell: UICollectionViewCell {

    static let identifier = "PartnerChattingCollectionViewCell"
    
    @IBOutlet var partnerImageView: UIImageView!
    @IBOutlet var partnerNameLabel: UILabel!
    @IBOutlet var partnerMessageLabel: UILabel!
    @IBOutlet var partnerDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .brown
    }
    
    func configureData(item: Chat) {
        partnerImageView.image = UIImage(named: item.user.image)
        partnerNameLabel.text = item.user.name
        partnerMessageLabel.text = item.message
        partnerDateLabel.text = item.date
    }

}
