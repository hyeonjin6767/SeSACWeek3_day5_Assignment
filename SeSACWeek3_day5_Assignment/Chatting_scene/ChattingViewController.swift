//
//  ChattingViewController.swift
//  SeSACWeek3_day5_Assignment
//
//  Created by 박현진 on 7/19/25.
//

import UIKit

class ChattingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static let identifier = "ChattingViewController"
    var chattingInfo = ChatList.list
    var talkPartner: ChatRoom = ChatRoom(chatroomId: 0, chatroomImage: "", chatroomName: "", chatList: [Chat(user: User(name: "", image: ""), date: "", message: "")])
    let dateFormat = DateFormatter()

    //@IBOutlet var chattingCollectionView: UICollectionView!
    @IBOutlet var chattingTableView: UITableView!
    @IBOutlet var chatroomNameNaviItem: UINavigationItem!
    @IBOutlet var inputMessageTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        inputMessageTextView.text = "메세지를 입력하세요"
    }
    private func configureView() {
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
        
        let xib1 = UINib(nibName: PartnerChattingTableViewCell.identifier, bundle: nil)
        chattingTableView.register(xib1, forCellReuseIdentifier: PartnerChattingTableViewCell.identifier)
        let xib2 = UINib(nibName: MyChattingTableViewCell.identifier, bundle: nil)
        chattingTableView.register(xib2, forCellReuseIdentifier: MyChattingTableViewCell.identifier)
        
        chattingTableView.rowHeight = UITableView.automaticDimension
 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return talkPartner.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let clickPartner = "\(talkPartner.chatList[indexPath.item].user.name)"
        //print(clickPartner)
        chatroomNameNaviItem.title = talkPartner.chatroomName
        if clickPartner == MyChattingTableViewCell.myName {
            print("채팅 테스트")
            let myCell = tableView.dequeueReusableCell(withIdentifier: MyChattingTableViewCell.identifier, for: indexPath) as! MyChattingTableViewCell
            myCell.configureData(row: talkPartner.chatList[indexPath.row])
            return myCell
        } else {
            let partnerCell = tableView.dequeueReusableCell(withIdentifier: PartnerChattingTableViewCell.identifier, for: indexPath) as! PartnerChattingTableViewCell
            partnerCell.configureData(row: talkPartner.chatList[indexPath.row])
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
        talkPartner.chatList.append(Chat(user: User(name: MyChattingTableViewCell.myName, image: "Me"), date: value, message: "\(inputMessageTextView.text!)"))
        chattingTableView.reloadData()
        inputMessageTextView.text?.removeAll()
        dump(talkPartner.chatList)
    }
    
}
