//
//  BuyPaymentTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/08.
//

import UIKit

class BuyPaymentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btn1(_ sender: Any) {
        if btn1.isSelected {
            btn1.isSelected = false
        }else {
            btn1.isSelected = true
        }
    }
    @IBAction func btn2(_ sender: Any) {
        if btn2.isSelected {
            btn2.isSelected = false
        }else {
            btn2.isSelected = true
        }
    }
    @IBAction func btn3(_ sender: Any) {
        if btn3.isSelected {
            btn3.isSelected = false
        }else {
            btn3.isSelected = true
        }
    }
    @IBAction func btn4(_ sender: Any) {
        if btn4.isSelected {
            btn4.isSelected = false
        }else {
            btn4.isSelected = true
        }
    }
    @IBAction func btn5(_ sender: Any) {
        if btn5.isSelected {
            btn5.isSelected = false
        }else {
            btn5.isSelected = true
        }
    }
    @IBAction func btn6(_ sender: Any) {
        if btn6.isSelected {
            btn6.isSelected = false
        }else {
            btn6.isSelected = true
        }
    }
    
    @IBAction func btn7(_ sender: Any) {
        if btn7.isSelected {
            btn7.isSelected = false
        }else {
            btn7.isSelected = true
        }
    }
    
}
