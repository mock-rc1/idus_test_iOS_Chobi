//
//  DetailPictureCommentCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/04.
//

import UIKit

class DetailPictureReviewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageComment: UIImageView!
    @IBOutlet weak var labelComment: UILabel!
    @IBOutlet weak var CommentInfo: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //왼쪽, 위에서 부터 글 나열하기
        labelComment.sizeToFit()
    }

}
