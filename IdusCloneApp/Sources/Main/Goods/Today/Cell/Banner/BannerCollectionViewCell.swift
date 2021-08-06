//
//  BannerCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/01.
//

import UIKit
import SDWebImage
class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageBanner: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(banner: TodayBanner) {
        self.imageBanner.sd_setImage(with: URL(string: banner.bannerImage!), completed: nil)
        
    }
}
