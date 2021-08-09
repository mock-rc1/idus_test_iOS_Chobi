//
//  CategoryClassTopTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/09.
//

import UIKit

class CategoryClassTopTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageFolder: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
