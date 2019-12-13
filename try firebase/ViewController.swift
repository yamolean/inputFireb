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
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapRegisterButton(_ sender: Any) {
        
    }
    
}

