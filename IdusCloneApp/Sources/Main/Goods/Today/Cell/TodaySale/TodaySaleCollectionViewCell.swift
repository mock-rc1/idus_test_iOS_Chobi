//
//  TodaySaleCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/06.
//

import UIKit
import SDWebImage
class TodaySaleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lableSale: UILabel!
    @IBOutlet weak var imageGoods: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSalePrice: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var imageStar: UIImageView!
    @IBOutlet weak var labelReviewNum: UILabel!
    @IBOutlet weak var labelReview: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(sale: TodaySale)  {
        if let x = sale.reviewComment {
            labelReview.text = x
        }else{
            labelReview.text = ""
        }
        imageGoods.sd_setImage(with: URL(string: sale.prodImage!), completed: nil)
        labelTitle.text = sale.prodName
        labelReviewNum.text = "(\(sale.prodReviewNum!))"
        labelSalePrice.text = "\(sale.saleCost!)".insertComma + "원"
        labelPrice.text = "\(sale.prodPrice!)".insertComma + "원"
        imageStar.image = rateStar(rate: sale.prodRatingAvg!)
        lableSale.text = "\(sale.salePercent!)%"
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
