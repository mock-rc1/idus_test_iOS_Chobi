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
            }else{
                labelReview.text = ""
            }
            labelReviewNum.text = "(\(todayGoods.prodReviewNum!))"
        }else{
            self.labelTodayGoods.text = todayRealtime.prodName!
            image.sd_setImage(with: URL(string: todayRealtime.prodImage!), completed: nil)
            if let x = todayRealtime.reviewComment{
                labelReview.text = x
            }else{
                labelReview.text = ""
            }
            labelReviewNum.text = "(\(todayRealtime.prodReviewNum!))"
        }
    }
    
}
