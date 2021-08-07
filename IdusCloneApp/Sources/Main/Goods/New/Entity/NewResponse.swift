//
//  NewResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//

import Foundation

struct NewResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message : String?
    var result : NewResult
}

struct NewResult: Decodable{
    var getBannerRes: [TodayBanner]?
    var getVisitAlikeRes: [TodayRelated]?
    var getTodayProdRes: [TodayGoods]?
    var getDisProdRes: [TodaySale]?
    var getRecOrderRes: [TodayRealtime]?
    var getNowOrderRes: [RealTime]?
    var getNowReviewRes: [RealTimeReview]?
    var getNewRes: [New]
}
