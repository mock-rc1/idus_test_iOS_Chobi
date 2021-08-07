//
//  OptionResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/06.
//

import Foundation
struct OptionResponse: Decodable {
    var isSuccess: Bool?
    var code : Int?
    var message: String?
    var result: [OptionResult]
}
struct OptionResult: Decodable {
    var prodSideIdx : Int?
    var sideCateNum : Int?
    var prodSideCate: String?
    var prodSide: String?
    var prodSidePrice : Int?
}
