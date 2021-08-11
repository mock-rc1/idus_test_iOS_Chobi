//
//  BasketResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/11.
//

import Foundation
struct BasketResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: BasketResult?
}
struct BasketResult: Decodable {
    var basketIdx: [Int]?
    var orderProdIdx: [Int]?
    var orderProdSideIdx : [Int]?
}
