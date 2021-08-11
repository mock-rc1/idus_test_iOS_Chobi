//
//  MyShippingResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/12.
//

import Foundation

struct MyShippingResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: [MyShippingResult]
}
struct MyShippingResult: Decodable {
    var totalPrice : Int?
    var statement: String?
    var prodName: String?
    var authorName: String?
    var date: String?
    var prodImage: String?
}
