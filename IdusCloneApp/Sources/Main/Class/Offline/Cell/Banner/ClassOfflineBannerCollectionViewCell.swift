//
//  ClassOfflineBannerCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/10.
//

import UIKit

class ClassOfflineBannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(banner: UIImage) {
        self.imageView.image = banner
        
    }
}
