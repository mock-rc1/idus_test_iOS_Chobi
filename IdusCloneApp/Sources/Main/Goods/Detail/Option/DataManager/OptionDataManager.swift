//
//  OptionDataManager.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/06.
//

import Foundation
import Alamofire

class OptionDataManager {
    func getOption(vc: OptionViewController, userIdx: Int, prodIdx: Int) {
        let url = "\(Constant.BASE_URL)/users/\(userIdx)/products/\(prodIdx)/sides"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                     "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: OptionResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.didSuccessOption(result: response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
