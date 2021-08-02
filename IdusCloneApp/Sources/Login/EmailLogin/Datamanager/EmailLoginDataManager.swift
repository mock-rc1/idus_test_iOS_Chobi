//
//  EmailLoginDataManager.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/02.
//

import Alamofire

class EmailLoginDataManager{
    func postEmailLogin(_ parameters: EmailLoginRequest, delegate: EmailLoginViewController) {
        AF.request("\(Constant.BASE_URL)/users/login", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: EmailLoginResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if ((response.isSuccess) != nil) {
                        delegate.didSuccessEmailLogin(response)
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 2000: delegate.failedToRequest(message: "상황에 맞는")
                        case 3000: delegate.failedToRequest(message: "에러 메시지로")
                        case 4000: delegate.failedToRequest(message: "사용자에게 적절한")
                        default: delegate.failedToRequest(message: "피드백을 주세요")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}

