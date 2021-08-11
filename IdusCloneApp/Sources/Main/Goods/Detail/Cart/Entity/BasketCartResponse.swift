//
//  BasketCartResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/11.
//

import Foundation

struct BasketCartResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: BasketCartResult
}
struct BasketCartResult: Decodable {
    var getBasketInfoRes : [GetBasketInfoRes]
    var getBasketPriceRes : [GetBasketPriceRes]
}
struct GetBasketInfoRes: Decodable{
    var prodIdx: Int?
    var authorName: String?
    var prodName: String?
    var prodNum: String?
    var request: String?
    var totalProd: Int?
    var deliveryCost: Int?
    var prodImage: String?
}
struct GetBasketPriceRes: Decodable{
    var basketIdx: Int?
    var prodIdx: Int?
    var orderProdIdx: Int?
    var prodSideCate: String?
    var prodSide: String?
    var optionPrice: Int?
    var prodCount: Int?
}
