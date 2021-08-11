//
//  MyShippingDataManager.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/12.
//

import Foundation
import Alamofire

class MyShippingDataManager {
    func getMyShipping(vc: ShippingGoodsViewController, userIdx: Int) {
        let url = "\(Constant.BASE_URL)/users/\(userIdx)/orders"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                     "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: MyShippingResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.didSuccessMyShipping(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToMyShipping(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
