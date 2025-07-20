//
//  PartnerChattingTableViewCell.swift
//  SeSACWeek3_day5_Assignment
//
//  Created by 박현진 on 7/20/25.
//

import UIKit

class PartnerChattingTableViewCell: UITableViewCell {

    static let identifier = "PartnerChattingTableViewCell"
    
    @IBOutlet var partnerImageView: UIImageView!
    @IBOutlet var partnerNameLabel: UILabel!
    @IBOutlet var partnerMessageLabel: UILabel!
    @IBOutlet var partnerDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .brown
    }

    func configureData(row: Chat) {
        partnerImageView.image = UIImage(named: row.user.image)
        partnerNameLabel.text = row.user.name
        partnerMessageLabel.text = row.message
        partnerDateLabel.text = row.date
    }
}
