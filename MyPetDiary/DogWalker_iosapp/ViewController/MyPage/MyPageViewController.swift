//
//  MyPageViewController.swift
//  DogWalker_iosapp
//
//  Created by 정지연 on 2021/01/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class MyPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var userNickName: UILabel!
    @IBOutlet weak var userInfo: UILabel!
    @IBOutlet weak var userPicture: UIImageView!
    var ref: DatabaseReference! = Database.database().reference()
    var userDataModel: FirebaseUserDataModel!
    // image - db
    var images = [#imageLiteral(resourceName: "mary"), #imageLiteral(resourceName: "hana"), #imageLiteral(resourceName: "dog"), #imageLiteral(resourceName: "dog (1)"), #imageLiteral(resourceName: "hana"), #imageLiteral(resourceName: "dog"), #imageLiteral(resourceName: "dog (1)"), #imageLiteral(resourceName: "ddog"), #imageLiteral(resourceName: "mary"), #imageLiteral(resourceName: "hana"), #imageLiteral(resourceName: "dog"), #imageLiteral(resourceName: "dog (1)"), #imageLiteral(resourceName: "hana"), #imageLiteral(resourceName: "dog"), #imageLiteral(resourceName: "dog (1)"), #imageLiteral(resourceName: "ddog")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 기기 토큰 확인하기
        let deviceToken = UserDefaults.standard.string(forKey: "token")!
        print("마이페이지 기기 토큰 확인:"+deviceToken)
        
        //userNickName.text = userDataModel.showUserNickname(deviceToken: "\(deviceToken)")
//
//        ref.child("User").child("\(deviceToken)").child("userInfo").observeSingleEvent(of: .value, with: { (snapshot) in
//
//            let value = snapshot.value as? NSDictionary
//
//            let userData = FirebaseUserDataModel()
//            userData.setValuesForKeys(value! as! [String : Any])
//
//            print("user_nickname: \(userData.user_nickname)")
//
////            let username = value?["user_nickname"] as? String ?? ""
////
////            print("username:"+username)
////
////            self.userNickName.text = username
//
//        }) { (error) in
//            print(error.localizedDescription)
//        }
    }
    // collectionview 설정 - 이미지 개수 count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    // 이미지 셀 추가
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as! CustomCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    // view size - 가로 3분할, 가로세로같게
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 1
        return CGSize(width: width, height: width)
    }
    // 위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    // 양옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

class CustomCell: UICollectionViewCell{
    @IBOutlet weak var imageView: UIImageView!
}
