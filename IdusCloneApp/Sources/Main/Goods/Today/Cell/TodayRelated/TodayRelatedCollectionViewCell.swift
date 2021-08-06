//
//  TodayRelatedCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/06.
//
import SDWebImage
import UIKit

class TodayRelatedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelReview: UILabel!
    @IBOutlet weak var labelReviewNum: UILabel!
    @IBOutlet weak var imageStar: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(todayRelated: TodayRelated) {
        image.sd_setImage(with: URL(string: todayRelated.prodImage!), completed: nil)
        if let x = todayRelated.reviewComment{
            labelReview.text = x
        }else{
            labelReview.text = ""
        }
        
        labelReviewNum.text = "(\(todayRelated.prodReviewNum!))"
        labelTitle.text = todayRelated.prodName!
        
    }
}
