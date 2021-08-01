//
//  LoginViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/07/31.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import Alamofire

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
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                            
                    // 어세스토큰
                    //let accessToken = oauthToken?.accessToken
                            
                    //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                    self.setUserInfo()
                }
        }
        
    }
    
    func setUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                //do something
                _ = user
                        
                // 닉네임: user?.kakaoAccount?.profile?.nickname
                print(user?.kakaoAccount?.profile?.nickname)
                
                // 프사: user?.kakaoAccount?.profile?.profileImageUrl
                if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                    let data = try? Data(contentsOf: url) {
                    //self.imageProfile.image = UIImage(data: data)
                }
            }
        }
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


