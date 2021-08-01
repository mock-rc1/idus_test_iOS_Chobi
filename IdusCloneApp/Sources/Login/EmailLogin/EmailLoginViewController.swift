//
//  EmailLoginViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/01.
//

import UIKit

class EmailLoginViewController: BaseViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - Helpers
    @IBAction func btnLogin(_ sender: Any) {
        let mainTabBarController = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(identifier: "MainTabBarController")
        changeRootViewController(mainTabBarController)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
