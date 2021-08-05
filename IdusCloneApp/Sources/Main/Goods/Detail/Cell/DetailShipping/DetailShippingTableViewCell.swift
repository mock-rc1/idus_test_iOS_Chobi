//
//  DetailShippingTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/03.
//

import UIKit

class DetailShippingTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDeliveryCost: UILabel!
    @IBOutlet weak var labelDelivertStart: UILabel!
    @IBOutlet weak var labelProNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(detailSummary: DetailSummary){
        labelDeliveryCost.text = "\(detailSummary.deliveryCost!)".insertComma + "원"
        labelDelivertStart.text = "\(detailSummary.deliveryStart!)일 이내"
        labelProNum.text = "\(detailSummary.prodNum!)"
    }
}
