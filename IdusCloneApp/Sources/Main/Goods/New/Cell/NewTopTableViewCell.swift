//
//  NewTopTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//

import UIKit
protocol HeartDelegate: AnyObject {
    func didSelectedHeartButton(isChecked: Bool)
   
}
class NewTopTableViewCell: UITableViewCell {

    
    @IBOutlet weak var btnCheck: UIButton!
    var delegate: HeartDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnCheck(_ sender: Any) {
        if(btnCheck.isSelected){
            btnCheck.isSelected = false
            delegate?.didSelectedHeartButton(isChecked: false)
        }else{
            btnCheck.isSelected = true
            delegate?.didSelectedHeartButton(isChecked: true)
        }
    }
    
}
