//
//  MyClassCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/10.
//

import UIKit

class MyClassCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(event: UIImage) {
        self.imageView.image = event
        
    }
}
