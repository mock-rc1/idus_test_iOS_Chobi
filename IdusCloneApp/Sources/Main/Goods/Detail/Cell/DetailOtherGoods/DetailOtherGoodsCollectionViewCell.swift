//
//  DetailOtherGoodsCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/06.
//

import UIKit

class DetailOtherGoodsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(detailOther: DetailOtherGoods) {
        label.text = detailOther.prodName!
        imageView.sd_setImage(with: URL(string: detailOther.prodImage!), completed: nil)
    }
}
