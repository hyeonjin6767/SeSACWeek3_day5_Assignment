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
        //backgroundColor = .brown
    }

    func configureData(row: Chat) {
        partnerImageView.image = UIImage(named: row.user.image)
        partnerImageView.layer.cornerRadius = partnerImageView.frame.width / 2
        partnerImageView.clipsToBounds = true
        partnerNameLabel.text = row.user.name
        partnerNameLabel.font = .boldSystemFont(ofSize: 12)
        partnerMessageLabel.text = row.message
        partnerMessageLabel.font = .systemFont(ofSize: 12)
        partnerDateLabel.text = row.date
        partnerDateLabel.font = .systemFont(ofSize: 10)
    }
}
