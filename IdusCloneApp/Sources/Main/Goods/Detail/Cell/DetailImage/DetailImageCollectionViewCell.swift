//
//  DetailImageCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/05.
//
import SDWebImage
import UIKit

class DetailImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(detailImage: DetailImage) {
        
        self.imageView.sd_setImage(with: URL(string: detailImage.prodImage!), completed: nil)
        //print(detailImage.prodImage!)
        
    }
}
