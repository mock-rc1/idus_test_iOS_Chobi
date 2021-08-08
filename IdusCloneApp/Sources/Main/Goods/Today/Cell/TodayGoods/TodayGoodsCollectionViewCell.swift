//
//  TodayGoodsCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/02.
//
import SDWebImage
import UIKit

class TodayGoodsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageStar: UIImageView!
    @IBOutlet weak var labelReview: UILabel!
    @IBOutlet weak var labelReviewNum: UILabel!
    
    @IBOutlet weak var labelTodayGoods: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(todayGoods: TodayGoods, todayRealtime: TodayRealtime, index: Int) {
        if(index == 1){
            self.labelTodayGoods.text = todayGoods.prodName!
            image.sd_setImage(with: URL(string: todayGoods.prodImage!), completed: nil)
            if let x = todayGoods.reviewComment{
                labelReview.text = x
            }
            imageStar.image = rateStar(rate: todayGoods.prodRatingAvg!)
            labelReviewNum.text = "(\(todayGoods.prodReviewNum!))"
        }else{
            if let y = todayRealtime.prodName{
                self.labelTodayGoods.text = y
            }
            if let z = todayRealtime.prodImage{
                image.sd_setImage(with: URL(string: z), completed: nil)
            }
            
            if let x = todayRealtime.reviewComment{
                labelReview.text = x
            }
            imageStar.image = rateStar(rate: todayRealtime.prodRatingAvg!)
            labelReviewNum.text = "(\(todayRealtime.prodReviewNum!))"
        }
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

