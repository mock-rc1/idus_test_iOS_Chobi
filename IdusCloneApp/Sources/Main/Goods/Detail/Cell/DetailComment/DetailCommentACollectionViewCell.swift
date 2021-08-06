//
//  DetailCommentACollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/06.
//

import UIKit

class DetailCommentACollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelComment: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelReply: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(detailComment: DetailComment)  {
        labelUserName.text = detailComment.userName!
        labelComment.text = detailComment.productComment!
        labelAuthor.text = detailComment.authorName!
        labelReply.text = detailComment.productReply!
    }
}
