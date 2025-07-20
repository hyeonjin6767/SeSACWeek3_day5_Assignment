//
//  ChattingViewController.swift
//  SeSACWeek3_day5_Assignment
//
//  Created by 박현진 on 7/19/25.
//

import UIKit

class ChattingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let identifier = "ChattingViewController"
    var chattingInfo = ChatList.list
    var talkPartner: ChatRoom = ChatRoom(chatroomId: 0, chatroomImage: "", chatroomName: "", chatList: [Chat(user: User(name: "", image: ""), date: "", message: "")])
    let dateFormat = DateFormatter()

    @IBOutlet var chattingCollectionView: UICollectionView!
    @IBOutlet var inputMessageTextF: UITextField!
    @IBOutlet var chatroomNameNaviItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        inputMessageTextF.placeholder = "메세지를 입력하세요"
    }
    private func configureView() {
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
        return talkPartner.chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let clickPartner = "\(talkPartner.chatList[indexPath.item].user.name)"
        //print(clickPartner)
        chatroomNameNaviItem.title = talkPartner.chatroomName
        if clickPartner == MyChattingCollectionViewCell.myName {
            print("채팅 테스트")
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: MyChattingCollectionViewCell.identifier, for: indexPath) as! MyChattingCollectionViewCell
            myCell.configureData(item: talkPartner.chatList[indexPath.item])
            return myCell
        } else {
            let partnerCell = collectionView.dequeueReusableCell(withReuseIdentifier: PartnerChattingCollectionViewCell.identifier, for: indexPath) as! PartnerChattingCollectionViewCell
            partnerCell.configureData(item: talkPartner.chatList[indexPath.item])
            
            return partnerCell
        }
    }
    
    @IBAction func popBackButoon(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        //값을 거꾸로 전달?
        //ChattingDataViewController.newChatting.chatList.append(talkPartner.chatList)
    }
    
    @IBAction func inputMessageTextFEnded(_ sender: UITextField) {
        print("입력감지")
        view.endEditing(true)
    }
    
    @IBAction func messageUpdateButtonClicked(_ sender: UIButton) {
        dateFormat.dateFormat = "hh:mm"
        let value = dateFormat.string(from: Date())
        talkPartner.chatList.append(Chat(user: User(name: MyChattingCollectionViewCell.myName, image: "Me"), date: value, message: "\(inputMessageTextF.text!)"))
        chattingCollectionView.reloadData()
        inputMessageTextF.text?.removeAll()
        dump(talkPartner.chatList)
    }
    
}
