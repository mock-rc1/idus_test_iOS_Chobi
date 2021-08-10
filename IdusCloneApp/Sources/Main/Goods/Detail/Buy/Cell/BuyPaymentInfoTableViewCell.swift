//
//  BuyPaymentInfoTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/08.
//

import UIKit

class BuyPaymentInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var btnSupport: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnSupport(_ sender: Any) {
        if btnSupport.isSelected {
            btnSupport.isSelected = false
        }else {
            btnSupport.isSelected = true
        }
    }
    
}
