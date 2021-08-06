//
//  DetailWithCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/06.
//

import UIKit

class DetailWithCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(detailWith: DetailWithGoods, detailHot: DetailHotGoods, index: Int) {
        if(index == 1){
            label.text = detailWith.prodName!
            
            if let x = detailWith.prodImage{
                image.sd_setImage(with: URL(string: x), completed: nil)
            }
        }else{
            label.text = detailHot.prodName!
            if let x = detailHot.prodImage{
                image.sd_setImage(with: URL(string: x), completed: nil)
            }
            
        }
    }
}
