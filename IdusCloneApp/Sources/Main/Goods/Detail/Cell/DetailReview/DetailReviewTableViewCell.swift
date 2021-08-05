//
//  DetailCommentTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/04.
//

import UIKit
//MARK: Protocol
protocol DetailReviewCollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: DetailReviewCollectionViewCell?, index: Int, didTappedInTableViewCell: DetailReviewTableViewCell)
}

class DetailReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewCollectionView: UICollectionView!
    
    // 데이터 배열
    var reviewArray : Array<DetailReview> = []
    var reviewProArray: Array<DetailReviewProdRes> = []
    
    //프로토콜 변수
    weak var detailReviewCellDelegate: DetailReviewCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - Helpers
    func setNib()  {
        self.reviewCollectionView.dataSource = self
        self.reviewCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "DetailReviewCollectionViewCell", bundle: nil)
                self.reviewCollectionView.register(cellNib, forCellWithReuseIdentifier: "DetailReviewCollectionViewCell")
        
        let cellPicNib = UINib(nibName: "DetailPictureReviewCollectionViewCell", bundle: nil)
                self.reviewCollectionView.register(cellPicNib, forCellWithReuseIdentifier: "DetailPictureReviewCollectionViewCell")
    }
}
//MARK: 테이블 뷰 셀 extension
extension DetailReviewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return reviewArray.count
        //return movieVO.popular.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // 컬렉션 뷰 한 줄에 2개가 딱 맞게 정사각형으로 들어가게!
        let width = reviewCollectionView.bounds.width
        //let height = reviewCollectionView.bounds.height
        
        if(reviewArray[indexPath.row].reviewImage != ""){
            return CGSize(width: width, height: 242)
        }else{
            return CGSize(width: width, height: 111)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(reviewArray[indexPath.row].reviewImage != ""){
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailPictureReviewCollectionViewCell", for: indexPath) as? DetailPictureReviewCollectionViewCell {
                cell.setCell(detailReview: reviewArray[indexPath.row],detailReviewProdRes: reviewProArray)
                return cell
            }
            }else{
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailReviewCollectionViewCell", for: indexPath) as? DetailReviewCollectionViewCell {
                    cell.setCell(detailReview: reviewArray[indexPath.row],detailReviewProdRes: reviewProArray)
                    return cell
                }
            }
                
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("콜렉션 뷰 " + String(indexPath.row))
        
    }
    
    //데이터 가져올 함수
    
    func setCell(detailReview: Array<DetailReview>, detailReviewProd: Array<DetailReviewProdRes> )  {
        self.reviewArray = detailReview
        self.reviewProArray = detailReviewProd
        self.reviewCollectionView.reloadData()
    }
}
