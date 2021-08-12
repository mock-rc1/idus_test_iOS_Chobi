//
//  NewCollectionViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//
import SDWebImage
import UIKit

class NewCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var labelProd: UILabel!
    @IBOutlet weak var imageNew: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(new: New)  {
        
        labelInfo.text = new.prodName!
        
        labelProd.text = new.authorName!
        imageNew.sd_setImage(with: URL(string: new.prodImage!), completed: nil)
    }
    
    @IBAction func btnCheck(_ sender: Any) {
        if(btnCheck.isSelected){
            btnCheck.isSelected = false
        }else{
            btnCheck.isSelected = true
        }
    }
}
