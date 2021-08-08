//
//  OptionNextDataManager.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/08.
//

import Alamofire
class OptionNextDataManager{
    func postOptionNext(_ parameters: OptionNextRequest, delegate: OptionNextViewController, userIdx: Int) {
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                     "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        AF.request("\(Constant.BASE_URL)/users/\(userIdx)/orders", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: header)
            .validate()
            .responseDecodable(of: OptionNextResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if ((response.isSuccess) != nil) {
                        delegate.didSuccessOptionNext(response)
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 2000: delegate.failedToOptionNext(message: "상황에 맞는")
                        case 3000: delegate.failedToOptionNext(message: "에러 메시지로")
                        case 4000: delegate.failedToOptionNext(message: "사용자에게 적절한")
                        default: delegate.failedToOptionNext(message: "피드백을 주세요")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToOptionNext(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
