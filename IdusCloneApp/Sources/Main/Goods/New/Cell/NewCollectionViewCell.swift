//
//  NewCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//
import SDWebImage
import UIKit

class NewCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var labelProd: UILabel!
    @IBOutlet weak var imageNew: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(new: New)  {
        if let x = new.reviewComment{
            labelInfo.text = x
        }
        labelProd.text = new.prodName!
        imageNew.sd_setImage(with: URL(string: new.prodImage!), completed: nil)
    }
    
}
