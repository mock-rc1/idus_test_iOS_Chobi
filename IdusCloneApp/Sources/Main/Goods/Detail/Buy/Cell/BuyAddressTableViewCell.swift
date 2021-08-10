//
//  BuyAddressTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/08.
//

import UIKit

class BuyAddressTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var btnSecure: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnSecure(_ sender: Any) {
        if btnSecure.isSelected {
            btnSecure.isSelected = false
        }else {
            btnSecure.isSelected = true
        }
    }
}
