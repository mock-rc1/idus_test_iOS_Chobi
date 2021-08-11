//
//  MyInfoProfileTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/08.
//

import UIKit
protocol ShippingProtocol: AnyObject {
    func didSelectBtnShipping()
}
class MyInfoProfileTableViewCell: UITableViewCell {
    var delegate: ShippingProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnShipping(_ sender: Any) {
        self.delegate?.didSelectBtnShipping()
    }
    
}
