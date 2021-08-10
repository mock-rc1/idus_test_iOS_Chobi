//
//  BuyDataManager.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/10.
//

import Foundation
import Alamofire

class BuyDataManager {
    func getBuy(vc: BuyViewController, userIdx: Int, orderIdx: Int) {
        let url = "\(Constant.BASE_URL)/users/\(userIdx)/orders/\(orderIdx)/payments"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                     "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: BuyResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.didSuccessBuy(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToBuy(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
