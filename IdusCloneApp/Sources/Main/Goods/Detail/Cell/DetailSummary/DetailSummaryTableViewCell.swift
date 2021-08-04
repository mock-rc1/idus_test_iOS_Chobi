//
//  DetailSummaryTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/03.
//

import UIKit

class DetailSummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var labelHeart: UILabel!
    @IBOutlet weak var btnHeart: UIButton!
    //weak var delegate: AnswerCellViewDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnHeart(_ sender: Any) {
        print("찜")
        //btnHeart.setImage(#imageLiteral(resourceName: "찜_주황"), for: .normal)
    
        labelHeart.text = String( Int(labelHeart.text!)! + 1)
        
    }
    
}
