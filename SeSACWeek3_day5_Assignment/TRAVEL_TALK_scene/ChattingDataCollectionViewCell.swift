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
        
        //finn님's
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            chatroomImageView.contentMode = .scaleAspectFit //scaleToFill(확대해서 꽉 채워주는거) cf) scaleAspectFill(베율로 채워주는거라 꽉 안 찰수도 있어)
            self.chatroomImageView.layer.cornerRadius = self.chatroomImageView.frame.width / 2
            self.chatroomImageView.clipsToBounds = true
            chatroomImageView.backgroundColor = .orange
        }
    }
    
    private func configureSetting() {
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

//finn님's
/*
 1. 인기도시 -> 정"원"으로 만들기 : "지연" or "scaleToFill"
 2. 부등호 사용해서 말풍선 너비 유동적으로 바꾸기 : 채팅화면
 3. autoDimension 사용해서 셀 높이 유동적으로 바꾸기 : 2번하기 전에 3번 먼저해보기
 */
