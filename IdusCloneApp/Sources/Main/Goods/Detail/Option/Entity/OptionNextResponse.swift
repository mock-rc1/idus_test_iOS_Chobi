//
//  OptionNextResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/08.
//

import Foundation
struct OptionNextResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: OptionNextResult?
}
struct OptionNextResult: Decodable {
    var orderIdx: Int?
    var orderProdIdx: [Int]?
    var orderProdSideIdx : [Int]?
}
