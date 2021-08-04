//
//  DetailKeywordCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/04.
//

import UIKit

class DetailKeywordCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelTag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelTag.sizeToFit()
    }

}
