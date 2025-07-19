//
//  ChattingViewController.swift
//  SeSACWeek3_day5_Assignment
//
//  Created by 박현진 on 7/19/25.
//

import UIKit

class ChattingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let identifier = "ChattingViewController"
    
    let chattingInfo = ChatList.list
    
    var talkPartner: ChatRoom = ChatRoom(chatroomId: 0, chatroomImage: "", chatroomName: "", chatList: [Chat(user: User(name: "", image: ""), date: "", message: "")])

    @IBOutlet var chattingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chattingCollectionView.delegate = self
        chattingCollectionView.dataSource = self
        
        let xib1 = UINib(nibName: PartnerChattingCollectionViewCell.identifier, bundle: nil)
        chattingCollectionView.register(xib1, forCellWithReuseIdentifier: PartnerChattingCollectionViewCell.identifier)
        let xib2 = UINib(nibName: MyChattingCollectionViewCell.identifier, bundle: nil)
        chattingCollectionView.register(xib2, forCellWithReuseIdentifier: MyChattingCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (16 * 2) - (16 * 0)
        layout.itemSize = CGSize(width: cellWidth / 1, height: cellWidth / 3)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .vertical
        //layout.minimumInteritemSpacing
        chattingCollectionView.collectionViewLayout = layout
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chattingInfo[talkPartner.chatroomId - 1].chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let clickPartner = "\(talkPartner.chatList[indexPath.item].user.name)"
        print(clickPartner)
        if clickPartner == MyChattingCollectionViewCell.myName {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: MyChattingCollectionViewCell.identifier, for: indexPath) as! MyChattingCollectionViewCell
            myCell.configureData(item: talkPartner.chatList[indexPath.item])
            return myCell
        } else {
            let partnerCell = collectionView.dequeueReusableCell(withReuseIdentifier: PartnerChattingCollectionViewCell.identifier, for: indexPath) as! PartnerChattingCollectionViewCell
            partnerCell.configureData(item: talkPartner.chatList[indexPath.item])
            return partnerCell
        }
    }
    
}
