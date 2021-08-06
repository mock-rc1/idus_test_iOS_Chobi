//
//  TodaySaleCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/06.
//

import UIKit

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

    
}
