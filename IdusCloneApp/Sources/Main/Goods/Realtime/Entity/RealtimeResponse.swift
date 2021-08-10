//
//  RealtimeResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//

import Foundation

struct RealtimeResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message : String?
    var result : RealtimeResult
}

struct RealtimeResult: Decodable{
    var getBannerRes: [TodayBanner]?
    var getVisitAlikeRes: [TodayRelated]?
    var getTodayProdRes: [TodayGoods]?
    var getDisProdRes: [TodaySale]?
    var getRecOrderRes: [TodayRealtime]?
    var getNowOrderRes: [RealTime]
    var getNowReviewRes: [RealTimeReview]?
    var getNewRes: [New]?
}
