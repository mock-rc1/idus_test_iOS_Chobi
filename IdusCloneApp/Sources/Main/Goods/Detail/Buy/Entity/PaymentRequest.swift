//
//  PaymentRequest.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/11.
//

import Foundation
struct PaymentRequest: Encodable {

    var orderIdx: Int?
    var totalPrice: Int?
    var deliveryIdx: Int?
    var paymentType: Int?
}
