//
//  PaymentResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/11.
//

import Foundation
struct PaymentResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: PaymentResult?
}
struct PaymentResult: Decodable {
    
}
