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
    @IBOutlet weak var btnAuthorName: UIButton!
    @IBOutlet weak var labelProdName: UILabel!
    @IBOutlet weak var labelSalePercent: UILabel!
    @IBOutlet weak var labelSaleCost: UILabel!
    @IBOutlet weak var labelProdPrice: UILabel!
    @IBOutlet weak var labelPoint: UILabel!
    @IBOutlet weak var imageProdRatingAvg: UIImageView!
    @IBOutlet weak var btnProdReviewNum: UIButton!
    @IBOutlet weak var labelProdReviewNum: UILabel!
    
    
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
        if btnHeart.isSelected{
            btnHeart.setImage(#imageLiteral(resourceName: "찜주황"), for: .normal)
            labelHeart.text = String( Int(labelHeart.text!)! + 1)
        }
        else{
            btnHeart.setImage(#imageLiteral(resourceName: "찜"), for: .normal)
            labelHeart.text = String( Int(labelHeart.text!)! - 1)
        }
        btnHeart.isSelected.toggle()
        
    }
    func setCell(detailSummary: DetailSummary) {
        
        btnAuthorName.setTitle("\(detailSummary.authorName!)>", for: .normal)
        labelProdName.text = detailSummary.authorName!
        labelSalePercent.text = "\(detailSummary.salePercent!)%"
        labelSaleCost.text = "\(detailSummary.saleCost!)".insertComma + "원"
        labelProdPrice.text = "\(detailSummary.prodPrice!)".insertComma + "원"
        labelPoint.text = "최대 \(detailSummary.point!)P"
        btnProdReviewNum.setTitle("(\(detailSummary.prodReviewNum!))>", for: .normal)
        labelProdReviewNum.text = "고객님들이 " + "\(detailSummary.orderNum!)".insertComma + "회 구매했어요!"
        labelHeart.text = "\(detailSummary.totalLike!)"
    }
}
