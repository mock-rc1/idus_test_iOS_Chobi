//
//  TodayResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/06.
//

import Foundation
struct TodayResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message : String?
    var result : TodayResult
}

struct TodayResult: Decodable{
    var getBannerRes: [TodayBanner]
    var getVisitAlikeRes: [TodayRelated]
    var getTodayProdRes: [TodayGoods]
    var getDisProdRes: [TodaySale]
    var getRecOrderRes: [TodayRealtime]
    var getNowOrderRes: [RealTime]?
    var getNowReviewRes: [RealTimeReview]?
    var getNewRes: [New]?
}

struct TodayBanner: Decodable {
    var bannerIdx: Int?
    var bannerImage: String?
}

struct TodayRelated: Decodable {
    var prodIdx: Int?
    var prodName: String?
    var prodReviewNum: Int?
    var prodRatingAvg: Float?
    var prodImage: String?
    var reviewComment: String?
}

struct TodayGoods: Decodable {
    var prodIdx: Int?
    var prodName: String?
    var prodReviewNum: Int?
    var prodRatingAvg: Float?
    var prodImage: String?
    var reviewComment: String?
}

struct TodaySale: Decodable{
    var prodIdx: Int?
    var salePercent: Int?
    var saleCost: Int?
    var prodPrice: Int?
    var prodName: String?
    var prodReviewNum: Int?
    var prodRatingAvg: Float?
    var prodImage: String?
    var reviewComment: String?
}

struct TodayRealtime: Decodable{
    var prodIdx: Int?
    var createAt: String?
    var prodReviewNum: Int?
    var prodRatingAvg: Float?
    var prodImage: String?
    var reviewComment: String?
    var prodName: String?
}

struct RealTime: Decodable{
    var prodIdx: Int?
    var createAt: String?
    var prodReviewNum: Int?
    var prodRatingAvg: Float?
    var prodImage: String?
    var reviewComment: String?
    var prodName: String?
    var authorName: String?
}
struct RealTimeReview: Decodable{
    var prodIdx: Int?
    var createAt: String?
    var prodReviewNum: Int?
    var prodRatingAvg: Float?
    var prodImage: String?
    var reviewComment: String?
    var prodName: String?
}
struct New: Decodable{
    var prodIdx: Int?
    var createAt: String?
    var prodImage: String?
    var prodName: String?
    var authorName: String?
}
