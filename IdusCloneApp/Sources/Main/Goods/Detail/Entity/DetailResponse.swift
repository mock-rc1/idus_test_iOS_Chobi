//
//  DetailResponse.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/05.
//

struct DetailResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message : String?
    var result : DetailResult
}

//상세 페이지 셀들~~~
struct DetailResult: Decodable {
    var getDetailProdImgRes: [DetailImage]
    var getDetailRes: DetailSummary
    var getDetailInfoRes: [DetailShipping]
    var getDetailReviewRes: [DetailReview]
    var getDetailReviewProdRes: [DetailReviewProdRes]
    var getDetailKeyWordRes: [DetailKeyword]
    var getDetailCommentRes: [DetailComment]
    var getDetailAuthorProdRes: [DetailOtherGoods]
    var getDetailCateProdRes: [DetailWithGoods]
    var getDetailHotRes: [DetailHotGoods]
}

//상세 이미지
struct DetailImage: Decodable {
    var prodImage: String?
}

//요약 정보 + 작가 정보
struct DetailSummary: Decodable {
    var authorName: String?
    var prodName: String?
    var salePercent: Int?
    var saleCost: Int?
    var prodPrice: Int?
    var point: Int?
    var prodRatingAvg: Float?
    var prodReviewNum: Int?
    var orderNum: Int?
    var latestLikeIdx: Int?
    var likeStatus: String?
    var totalLike: Int?
    var deliveryCost: Int?
    var deliveryStart: Int?
    var prodNum: String?
    var prodComment : String?
    var makeDeliveryInfo: String?
    var exchangeType: String?
    var exchangeInfo: String?
    var totalLikeNum: Int?
    var totalFollowNum: Int?
    var totalSupportNum: Int?
    var authorComment: String?
}

//배송
struct DetailShipping: Decodable{
    var infoName: String?
    var info: String?
}

//리뷰
struct DetailReview: Decodable{
    var prodReviewIdx: Int?
    var userName: String?
    var dates: String?
    var rating: Float?
    var reviewImage: String?
    var reviewComment: String?
}

//리뷰 - 제품 정보
struct DetailReviewProdRes: Decodable {
    var prodReviewIdx: Int?
    var prodSideCate: String?
    var prodSide: String?
}

//키워드
struct DetailKeyword: Decodable {
    var keyWord: String?
}

//댓글
struct DetailComment: Decodable {
    var prodCommentIdx: Int?
    var userName: String?
    var productComment: String?
    var authorName: String?
    var productReply: String?
}

//판매중인 다른 작품들
struct DetailOtherGoods: Decodable{
    var idx: Int?
    var prodImage: String?
    var prodName: String?
}

//이 작품과 함께 본 작품
struct DetailWithGoods: Decodable{
    var prodIdx: Int?
    var prodImage: String?
    var prodName: String?
}

//인기 작품
struct DetailHotGoods: Decodable{
    var prodIdx: Int?
    var prodImage: String?
    var prodName: String?
}
