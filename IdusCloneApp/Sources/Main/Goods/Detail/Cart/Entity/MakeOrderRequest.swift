//
//  MakeOrderRequest.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/11.
//

import Foundation
struct MakeOrderRequest: Encodable {
    var basketIdx: [Int]?
    var orderProdIdx: [Int]?
   
}
