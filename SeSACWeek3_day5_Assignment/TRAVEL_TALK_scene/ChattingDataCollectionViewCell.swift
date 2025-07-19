//
//  ChattingDataCollectionViewCell.swift
//  SeSACWeek3_day5_Assignment
//
//  Created by 박현진 on 7/19/25.
//

import UIKit

class ChattingDataCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ChattingDataCollectionViewCell"

    @IBOutlet var chatroomImageView: UIImageView!
    @IBOutlet var chatroomNameLabel: UILabel!
    @IBOutlet var chatroomMessageLabel: UILabel!
    @IBOutlet var chatroomDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureSetting()
    }
    
    private func configureSetting() {
        chatroomImageView.contentMode = .scaleAspectFit
        chatroomImageView.layer.cornerRadius = chatroomImageView.frame.width / 2
        chatroomImageView.clipsToBounds = true
        chatroomNameLabel.font = .boldSystemFont(ofSize: 12)
        chatroomNameLabel.textColor = .black
        chatroomMessageLabel.textColor = .gray
        chatroomMessageLabel.font = .systemFont(ofSize: 10)
        chatroomDateLabel.textColor = .gray
        chatroomDateLabel.font = .systemFont(ofSize: 10)
    }
    
    func configureData(item: ChatRoom) {
        chatroomImageView.image = UIImage(named: item.chatroomImage)
        chatroomNameLabel.text = item.chatroomName
        chatroomMessageLabel.text = item.chatList.last?.message
        chatroomDateLabel.text = item.chatList.last?.date
    }

}
