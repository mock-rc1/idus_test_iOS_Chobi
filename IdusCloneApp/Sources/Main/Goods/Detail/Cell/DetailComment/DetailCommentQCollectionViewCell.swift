//
//  DetailCommentQCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/06.
//

import UIKit

class DetailCommentQCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(detailComment: DetailComment)  {
        labelName.text = detailComment.userName!
        labelContent.text = detailComment.productComment!
    }
}
