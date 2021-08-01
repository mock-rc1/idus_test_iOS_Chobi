//
//  LoginViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/07/31.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import NaverThirdPartyLogin
import Alamofire

class LoginViewController: BaseViewController, NaverThirdPartyLoginConnectionDelegate{
    
    //MARK: - Outlet
    
    @IBOutlet weak var btnKakaoLogin: UIButton!
    @IBOutlet weak var btnEmailLogin: UIButton!
    @IBOutlet weak var btnNaverLogin: UIButton!
    @IBOutlet weak var btnNoLogin: UIButton!
    
    //네이버 로그인 인스턴스
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loginInstance?.delegate = self
    }
    
    //MARK: - Helpers
    
    //MARK: 카카오 로그인
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
    
    //MARK: 이메일 회원가입
    @IBAction func btnEmailLogin(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    //MARK: 네이버 로그인
    // 로그인에 성공한 경우 호출
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("Success login")
        getInfo()
    }
    
    // referesh token
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        loginInstance?.accessToken
    }
    
    // 로그아웃
    func oauth20ConnectionDidFinishDeleteToken() {
        print("log out")
    }
    
    // 모든 error
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("error = \(error.localizedDescription)")
    }
    
    // RESTful API, id가져오기
    func getInfo() {
      guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
      
      if !isValidAccessToken {
        return
      }
      
      guard let tokenType = loginInstance?.tokenType else { return }
      guard let accessToken = loginInstance?.accessToken else { return }
        
      let urlStr = "https://openapi.naver.com/v1/nid/me"
      let url = URL(string: urlStr)!
      
      let authorization = "\(tokenType) \(accessToken)"
      
      let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
      
      req.responseJSON { response in
        guard let result = response.value as? [String: Any] else { return }
        guard let object = result["response"] as? [String: Any] else { return }
        guard let name = object["name"] as? String else { return }
        guard let email = object["email"] as? String else { return }
        guard let id = object["id"] as? String else {return}
        
        print(email)
        
        //self.nameLabel.text = "\(name)"
        //self.emailLabel.text = "\(email)"
        //self.id.text = "\(id)"
      }
    }
    @IBAction func btnNaverLogin(_ sender: Any) {
        loginInstance?.requestThirdPartyLogin()
    }
    
    //MARK: 기존 회원 로그인
    @IBAction func btnOldMemberLogin(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "EmailLoginViewController") as? EmailLoginViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    
    //MARK: 로그인 안하고 둘러보기
    @IBAction func btnNoLogin(_ sender: Any) {
    }
    
}


