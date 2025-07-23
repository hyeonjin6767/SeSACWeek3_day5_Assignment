//
//  ChattingDataViewController.swift
//  SeSACWeek3_day5_Assignment
//
//  Created by 박현진 on 7/19/25.
//

import UIKit

class ChattingDataViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
        
    @IBOutlet var chatListCollectionView: UICollectionView!
    @IBOutlet var searchBarTextField: UITextField!
    
    let chatroomInfo = ChatList.list
    var filter: [ChatRoom] = [ChatRoom(chatroomId: 0, chatroomImage: "", chatroomName: "", chatList: [Chat(user: User(name: "", image: ""), date: "", message: "")])]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //값을 거꾸로 전달?
        //ChattingDataViewController.newChatting.chatList.append(<#T##newElement: Chat##Chat#>)
    }
    
    private func configureView() {
        chatListCollectionView.delegate = self
        chatListCollectionView.dataSource = self
        
        let xib = UINib(nibName: ChattingDataCollectionViewCell.identifier, bundle: nil)
        chatListCollectionView.register(xib, forCellWithReuseIdentifier: ChattingDataCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (16 * 2) - (16 * 0)
        layout.itemSize = CGSize(width: cellWidth / 1, height: cellWidth / 4)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .vertical
        //layout.minimumInteritemSpacing =
        chatListCollectionView.collectionViewLayout = layout
        searchBarTextField.placeholder = "친구 이름을 검색해보세요"
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatroomInfo.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 수업자료에 타입캐스팅 부분 복기
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChattingDataCollectionViewCell.identifier, for: indexPath) as! ChattingDataCollectionViewCell
        cell.configureData(item: chatroomInfo[indexPath.item])
        return cell
       
    }
    
    @IBAction func searchBarTextFEnded(_ sender: UITextField) {
        //let all = ChatList.list
        //print(ChatList.list.count)
        
        print(chatroomInfo.count - 1)
        
        for i in 0...chatroomInfo.count - 1 {
            
            guard let searchName = searchBarTextField.text, chatroomInfo[i].chatroomName.contains(searchName) else {
                
                print(chatroomInfo[i].chatroomName)
                print("찾는 방 없음")
                ChatList.list = chatroomInfo
                return
            }
            filter.append(chatroomInfo[i])
            ChatList.list = filter
        }
        chatListCollectionView.reloadData()
    }
    
    func findRoomName(index: Int) {
        
        chatListCollectionView.reloadData()
    }
    
//
//    @IBAction func searchBarTextFEnded(_ sender: UITextField) {
//        let all = chatroomInfo
//        newChatting =
//        
//        
//    }
//    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.endEditing(true)
        let viewCon = storyboard?.instantiateViewController(withIdentifier: ChattingViewController.identifier) as! ChattingViewController
        viewCon.talkPartner = chatroomInfo[indexPath.item]
        navigationController?.pushViewController(viewCon, animated: true)
        
    }
}
