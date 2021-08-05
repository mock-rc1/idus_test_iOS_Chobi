//
//  DetailCommentCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/04.
//

import UIKit

class DetailReviewCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var lableUserName: UILabel!
    @IBOutlet weak var labelDates: UILabel!
    @IBOutlet weak var labelReviewComment: UILabel!
    @IBOutlet weak var labelDetailReviewProRes: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(detailReview: DetailReview, detailReviewProdRes: [DetailReviewProdRes]){
        lableUserName.text = "\(detailReview.userName!)"
        labelDates.text = "\(detailReview.dates!)"
        labelReviewComment.text = "\(detailReview.reviewComment!)"
        var buything = ""
        for i in detailReviewProdRes{
            if(i.prodReviewIdx == detailReview.prodReviewIdx){
                buything += "\(i.prodSideCate!): \(i.prodSide!) / "
            }
        }
        labelDetailReviewProRes.text = buything
    }
}
