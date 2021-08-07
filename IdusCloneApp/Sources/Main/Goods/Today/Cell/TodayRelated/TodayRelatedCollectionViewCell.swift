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
        imageStar.image = rateStar(rate: todayRelated.prodRatingAvg!)
        
    }
    func rateStar(rate: Float) -> UIImage{
        if(rate >= 4.5){
            return #imageLiteral(resourceName: "별5개")
        }else if(rate >= 4.0){
            return #imageLiteral(resourceName: "별4개")
        }else if(rate >= 3.0){
            return #imageLiteral(resourceName: "별3개")
        }else if(rate >= 2.0){
            return #imageLiteral(resourceName: "별2개")
        }else if(rate >= 1.0){
            return #imageLiteral(resourceName: "별1개")
        }else{
            return #imageLiteral(resourceName: "별0개")
        }
    }
}
