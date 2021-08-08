//
//  RealTimeCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//

import UIKit
import SDWebImage
class RealTimeCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var imageRealtime: UIImageView!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var imageStar: UIImageView!
    @IBOutlet weak var labelReviewNum: UILabel!
    @IBOutlet weak var labelReview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(realtime: RealTime){
        if let z = realtime.prodImage{
            imageRealtime.sd_setImage(with: URL(string: z), completed: nil)
        }
        if let y = realtime.authorName{
            labelAuthor.text = y
        }
        
        if let a = realtime.prodName{
            labelInfo.text = a
        }
        
        if let x = realtime.reviewComment{
            labelReview.text = x
        }else{
            labelReview.text = ""
        }
        imageStar.image = rateStar(rate: realtime.prodRatingAvg!)
        labelReviewNum.text = "(\(realtime.prodReviewNum!))"
        
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
