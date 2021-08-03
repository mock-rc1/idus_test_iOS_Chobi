//
//  TodayGoodsCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/02.
//

import UIKit

class TodayGoodsCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var labelTodayGoods: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(todayGoods: String) {
        self.labelTodayGoods.text = todayGoods
    }
}
