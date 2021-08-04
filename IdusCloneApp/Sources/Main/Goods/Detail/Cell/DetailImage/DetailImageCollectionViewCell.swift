//
//  DetailImageCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/05.
//

import UIKit

class DetailImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(detailImage: UIImage) {
        self.imageView.image = detailImage
    }
}
