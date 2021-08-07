//
//  RealtimeDatamanager.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//

import Foundation
import Alamofire
class RealtimeDataManager {
    func getRealtime(vc: RealtimeViewController, userIdx: Int, tab: String) {
        let url = "\(Constant.BASE_URL)/users/\(userIdx)/homes/?tab=\(tab)"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                     "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: RealtimeResponse.self) { response in
                switch response.result {
                case .success(let response):
                    vc.didSuccessRealtime(result: response)
                case .failure(let error):
                    print(error.localizedDescription)
                    vc.failedToRequestRealtime(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
