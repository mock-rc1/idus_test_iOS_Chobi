//
//  ShippingGoodsTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/12.
//

import UIKit

class ShippingGoodsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var btnState: UIButton!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var imageProd: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
