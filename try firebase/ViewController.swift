//
//  ViewController.swift
//  try firebase
//
//  Created by 矢守叡 on 2019/12/12.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit
import Firebase

enum FavoriteMeal: String {
    case japanese, weastern, chinese, italian
    static let items: [FavoriteMeal] = [.japanese, .weastern, .chinese, .italian]
}
 
enum FavoriteSports: String {
    case baseball, soccer, tennis
    static let items: [FavoriteSports] = [.baseball, .soccer, .tennis]
}
 
enum YourPet: String {
    case dog, cat
    static let items: [YourPet] = [.dog, .cat]
}

class ViewController: UIViewController {

    @IBOutlet weak var favoriteMealSegment: UISegmentedControl!
    @IBOutlet weak var favoriteSportsSegment: UISegmentedControl!
    @IBOutlet weak var yourPetSegment: UISegmentedControl!
    @IBOutlet weak var breakfastEverdaySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapRegisterButton(_ sender: Any) {
        // サインインしていない場合のエラー処理,ログインユーザを取得Auth.auth().currentUser
        guard let user = Auth.auth().currentUser else {
            return
        }
        // Viewで選択されたもん
        let favoriteMeal = FavoriteMeal.items[favoriteMealSegment.selectedSegmentIndex].rawValue
        let favoriteSports = FavoriteSports.items[favoriteSportsSegment.selectedSegmentIndex].rawValue
        let yourPet = YourPet.items[yourPetSegment.selectedSegmentIndex].rawValue
        let breakfastEverday = breakfastEverdaySwitch.isOn
         
        //Firestoreオブジェクト
        let db = Firestore.firestore()
        
        // usersコレクションに対してアクセス .collection("users")
        // ドキュメントを抽象化した参照オブジェクトを取得 .document(user.uid)
        // Firestoreデータベースに実際にデータを渡す .setData
        // 辞書型で渡す
        db.collection("users").document(user.uid).setData([
            "favoriteMeal": favoriteMeal,
            "favoriteSports": favoriteSports,
            "yourPet": yourPet,
            "breakfastEverday": breakfastEverday,
        ]) { error in
            if let error = error {
                return
            }
            
        }
    }
}

