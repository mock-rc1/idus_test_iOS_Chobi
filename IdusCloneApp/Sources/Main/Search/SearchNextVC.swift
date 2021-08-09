//
//  SerachNextViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/09.
//

import Foundation
import UIKit
class SearchNextVC: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: false) {
        let mainTabBarController = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(identifier: "MainTabBarController")
            self.changeRootViewController(mainTabBarController)
        }
    }
}
