//
//  BuyResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/10.
//


import Foundation
struct BuyResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: BuyResult
}
struct BuyResult: Decodable {
    var getPaymentInfoRes :  GetPaymentInfoRes
    var getPaymentDeliveryRes : [GetPaymentDeliveryRes]
    var getPaymentProdRes : [GetPaymentProdRes]
    var getPaymentOptionRes: [GetPaymentOptionRes]
    var getPaymentTotalDeliRes : GetPaymentTotalDeliRes
}

struct GetPaymentInfoRes: Decodable{
    var userName: String?
    var phoneNum: String?
    var paymentName: String?
    var paymentNum: String?
    var totalProdPrice: Int?
}
struct GetPaymentDeliveryRes: Decodable{
    var deliveryIdx: Int?
    var deliveryName: String?
    var deliveryPhoneNum: String?
    var address: String?
}
struct GetPaymentProdRes: Decodable{
    var orderIdx: Int?
    var prodIdx: Int?
    var authorName: String?
    var prodImage: String?
    var prodName: String?
    var prodNum: String?
    var deliveryCost: Int?
    var minFreeCost: Int?
}
struct GetPaymentOptionRes: Decodable {
    var orderIdx: Int?
    var prodIdx: Int?
    var orderProdIdx: Int?
    var prodSideCate: String?
    var prodSide: String?
    var optionPrice: Int?
    var prodCount: Int?
}

struct GetPaymentTotalDeliRes: Decodable{
    var orderIdx: Int?
    var totalDeliveryCost: Int?
}

