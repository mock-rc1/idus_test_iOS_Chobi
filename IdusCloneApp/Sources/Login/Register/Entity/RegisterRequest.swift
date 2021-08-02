//
//  RegisterInput.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/02.
//

struct RegisterRequest: Encodable {
    var email: String?
    var userName: String?
    var password: String?
    var phoneNum: String?
}
