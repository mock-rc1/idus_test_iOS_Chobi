//
//  EmailLoginResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/02.
//

struct EmailLoginResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: Result?
}

struct Result: Decodable {
    var userIdx: Int?
    var jwt: String?
}
