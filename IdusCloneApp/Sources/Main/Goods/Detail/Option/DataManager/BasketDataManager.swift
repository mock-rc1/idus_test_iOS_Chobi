//
//  BasketDataManager.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/11.
//
import Alamofire
import Foundation
class BasketDataManager{
    func postBasket(_ parameters: BasketRequest, delegate: OptionNextViewController, userIdx: Int) {
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                     "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        AF.request("\(Constant.BASE_URL)/users/\(userIdx)/orders/baskets", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: header)
            .validate()
            .responseDecodable(of: BasketResponse.self) { response in
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    if ((response.isSuccess) != nil) {
                        delegate.didSuccessBasket(response)
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 2000: delegate.failedToBasket(message: "상황에 맞는")
                        case 3000: delegate.failedToBasket(message: "에러 메시지로")
                        case 4000: delegate.failedToBasket(message: "사용자에게 적절한")
                        default: delegate.failedToBasket(message: "피드백을 주세요")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToBasket(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
