//
//  KakaoResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/13.
//

import Foundation
struct KakaoResponse: Decodable {
    
    var result: KakaoResult?
    var code: Int?
    var message: String?
    var isSuccess: Bool?
}

struct KakaoResult: Decodable {
    
    var jwt: String?
    var userIdx: Int?
}
