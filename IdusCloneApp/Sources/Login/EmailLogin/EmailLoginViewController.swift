//
//  EmailLoginViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/01.
//

import UIKit

class EmailLoginViewController: BaseViewController {
    
    //MARK: - Outlet
    
  
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    // Datamanager
    lazy var dataManager: EmailLoginDataManager = EmailLoginDataManager()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    
    //MARK: - Helpers
    func setUI() {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let outerVisualEffectView = UIVisualEffectView(effect: blurEffect)
        outerVisualEffectView.frame = self.view.frame
        //outerVisualEffectView.alpha = 1
        imageBackground.addSubview(outerVisualEffectView)
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        
        // Email validation
        guard let email = textEmail.text?.trim, email.isExists else {
            self.presentAlert(title: "이메일을 입력해주세요")
            return
        }
        
        // Password validation
        guard let password = textPassword.text, password.isExists else {
            self.presentAlert(title: "비밀번호를 입력해주세요")
            return
        }
        let input = EmailLoginRequest(email: email, password: password)
        print(email)
        dataManager.postEmailLogin(input, delegate: self)
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func goMainPage() {
        let mainTabBarController = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(identifier: "MainTabBarController")
        changeRootViewController(mainTabBarController)
    }
}
extension EmailLoginViewController {
    func didSuccessEmailLogin(_ result: EmailLoginResponse) {
        self.presentAlert(title: "로그인에 성공하였습니다", message: result.message)
        
        if let x = result.result{
            Constant.userIdx = x.userIdx!
            print("박서준 인텍스\(Constant.userIdx)")
        }
        //print(Constant.userIdx)
        self.goMainPage()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
