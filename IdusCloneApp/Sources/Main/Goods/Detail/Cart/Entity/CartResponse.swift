//
//  CartResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/10.
//

import Foundation
struct CartResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: CartResult
}
struct CartResult: Decodable {
    var getNowBasketinfoRes : GetNowBasketinfoRes
    var getNowBasketOptionRes : [GetNowBasketOptionRes]
}

struct GetNowBasketinfoRes: Decodable{
    var orderIdx: Int?
    var authorName: String?
    var prodName: String?
    var prodNum: String?
    var prodImage: String?
    var deliveryCost : Int?
    var minFreeCost : Int?
}
struct GetNowBasketOptionRes: Decodable{
    var orderIdx: Int?
    var prodIdx: Int?
    var orderProdIdx: Int?
    var prodSideCate: String?
    var prodSide: String?
    var optionPrice: Int?
}
