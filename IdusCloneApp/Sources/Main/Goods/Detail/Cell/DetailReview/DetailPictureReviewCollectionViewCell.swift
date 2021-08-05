//
//  DetailPictureCommentCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/04.
//

import UIKit
import SDWebImage
class DetailPictureReviewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageComment: UIImageView!
    @IBOutlet weak var CommentInfo: UILabel!
    @IBOutlet weak var labelDates: UILabel!
    @IBOutlet weak var labelReviewComment: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    func setCell(detailReview: DetailReview, detailReviewProdRes: [DetailReviewProdRes]){
        labelUserName.text = "\(detailReview.userName!)"
        labelDates.text = "\(detailReview.dates!)"
        labelReviewComment.sizeToFit() //왼쪽, 위에서 부터 글 나열하기
        labelReviewComment.text = "\(detailReview.reviewComment!)"
        imageComment.sd_setImage(with: URL(string: detailReview.reviewImage!), completed: nil)
        var buything = ""
        for i in detailReviewProdRes{
            if(i.prodReviewIdx == detailReview.prodReviewIdx){
                buything += "\(i.prodSideCate!): \(i.prodSide!) / "
            }
        }
        CommentInfo.text = buything
    }
}
