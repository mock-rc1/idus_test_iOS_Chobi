//
//  CartTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var imageProd: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelMake: UILabel!
    @IBOutlet weak var labelOption: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var textRequest: UITextField!
    @IBOutlet weak var labelTotalPrice: UILabel!
    @IBOutlet weak var labelShipping: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
