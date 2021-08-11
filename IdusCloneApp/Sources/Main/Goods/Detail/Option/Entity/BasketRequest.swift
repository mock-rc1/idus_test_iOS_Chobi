//
//  BasketRequest.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/11.
//

import Foundation
struct BasketRequest: Encodable {
    var userIdx: Int?
    var prodIdx: Int?
    var authorIdx: Int?
    
    var prodPrice: [Int]?
    var prodCount: [Int]?
    var prodSideIdx: [Int]?
}

