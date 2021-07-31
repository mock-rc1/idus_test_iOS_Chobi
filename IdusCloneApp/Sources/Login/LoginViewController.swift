//
//  LoginViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/07/31.
//

import UIKit
class LoginViewController: BaseViewController{
    
    //MARK: - Outlet
    
    @IBOutlet weak var btnKakaoLogin: UIButton!
    @IBOutlet weak var btnEmailLogin: UIButton!
    @IBOutlet weak var btnNaverLogin: UIButton!
    @IBOutlet weak var btnNoLogin: UIButton!
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Helpers
    
    
    @IBAction func btnKakoLogin(_ sender: Any) {
    }
    
    @IBAction func btnEmailLogin(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func btnNaverLogin(_ sender: Any) {
    }
    
    @IBAction func btnNoLogin(_ sender: Any) {
    }
    
}
