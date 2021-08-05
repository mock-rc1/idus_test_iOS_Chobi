//
//  DetailAuthorTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/04.
//

import UIKit

class DetailAuthorTableViewCell: UITableViewCell {

    @IBOutlet weak var labelAuthorName: UIButton!
    @IBOutlet weak var labelProdRatingAvg: UILabel!
    @IBOutlet weak var imageRatingAvg: UIImageView!
    @IBOutlet weak var labelProdReviewNum: UILabel!
    @IBOutlet weak var labelTotalLikeNum: UILabel!
    @IBOutlet weak var labelTotalFollowNum: UILabel!
    @IBOutlet weak var labelTotalSupportNum: UILabel!
    @IBOutlet weak var labelAuthorComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(detailSummary: DetailSummary){
        labelAuthorName.setTitle(detailSummary.authorName!, for: .normal)
        labelProdReviewNum.text = "(\(detailSummary.prodReviewNum!))"
        labelProdRatingAvg.text = "\(detailSummary.prodRatingAvg!)"
        labelTotalLikeNum.text = "\(detailSummary.totalLikeNum!)"
        labelTotalFollowNum.text = "\(detailSummary.totalFollowNum!)"
        labelTotalSupportNum.text = "\(detailSummary.totalSupportNum!)"
        labelAuthorComment.text = detailSummary.authorComment!
        
    }
}
