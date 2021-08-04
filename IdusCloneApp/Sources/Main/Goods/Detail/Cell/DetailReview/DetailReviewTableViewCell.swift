//
//  DetailCommentTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/04.
//

import UIKit

class DetailReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewCollectionView: UICollectionView!
    
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
        
        return 2
        //return movieVO.popular.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // 컬렉션 뷰 한 줄에 2개가 딱 맞게 정사각형으로 들어가게!
        let width = reviewCollectionView.bounds.width
        let height = reviewCollectionView.bounds.height
        switch indexPath.row {
        case 0:
            return CGSize(width: width, height: 111)
        case 1:
            return CGSize(width: width, height: 242)
        default:
            return CGSize(width: width, height: height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailReviewCollectionViewCell", for: indexPath) as? DetailReviewCollectionViewCell {
                //cell.setCell(todayGoods: todayGoodsArray[indexPath.row])
                return cell
            }
        case 1:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailPictureReviewCollectionViewCell", for: indexPath) as? DetailPictureReviewCollectionViewCell {
                //cell.setCell(todayGoods: todayGoodsArray[indexPath.row])
                return cell
            }
        default:
            return UICollectionViewCell()
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("콜렉션 뷰 " + String(indexPath.row))
        /*
        let cell = collectionView.cellForItem(at: indexPath) as? TodayGoodsCollectionViewCell
            self.todayGoodsCellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)
         */
    }
    
    //데이터 가져올 함수
    /*
    func setCell(row: Array<String>)  {
        self.todayGoodsArray = row
        self.todayGoodsCollectionView.reloadData()
    }*/
}
