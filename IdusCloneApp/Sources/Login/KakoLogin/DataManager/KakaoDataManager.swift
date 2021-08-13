//
//  KakaoDataManager.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/13.
//
import Alamofire
import Foundation
class KakaoDataManager {
    func postKakao( request: KakaoRequest, viewController: LoginViewController, kakao: String) {
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                     "X-ACCESS-TOKEN":"\(kakao)"]
        AF.request("\(Constant.BASE_URL)/users/kakaoLogin", method: .post, parameters: request, encoder: JSONParameterEncoder(), headers: header)
            .validate()
            .responseDecodable(of: KakaoResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess!, let result = response.result {
                        viewController.didSuccessKakao(result)

                    } else {
                        viewController.failedToKakao(message: response.message!)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    viewController.failedToKakao(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
