//
//  BasketCartDataManager.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/11.
//

import Foundation
import Alamofire

class BasketCartDataManager {
    func getBasketCart(vc: CartViewController, userIdx: Int) {
        let url = "\(Constant.BASE_URL)/users/\(userIdx)/orders/baskets"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                     "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: BasketCartResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.didSuccessBasketCart(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToBasketCart(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
