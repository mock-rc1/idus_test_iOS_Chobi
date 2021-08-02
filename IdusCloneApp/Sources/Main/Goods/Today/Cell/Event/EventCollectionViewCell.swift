//
//  EventCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/02.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageEvent: UIImageView!
    @IBOutlet weak var labelEvent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(event: UIImage) {
        self.imageEvent.image = event
    }
}
