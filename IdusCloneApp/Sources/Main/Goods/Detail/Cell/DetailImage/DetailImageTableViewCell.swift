//
//  DetailImageTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/03.
//

import UIKit

//MARK: Protocol
protocol DetailImageCollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: DetailImageCollectionViewCell?, index: Int, didTappedInTableViewCell: DetailImageTableViewCell)
}

class DetailImageTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout {

    //MARK: - Outlet
    
    //이미지 콜렉션 뷰
    @IBOutlet weak var detailImageCollectionView: UICollectionView!
    
    //프로토콜 변수
    weak var detailImageCellDelegate: DetailImageCollectionViewCellDelegate?
    
    // 데이터 배열
    var imageArray : Array<DetailImage> = []
    
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
        self.detailImageCollectionView.dataSource = self
        self.detailImageCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "DetailImageCollectionViewCell", bundle: nil)
                self.detailImageCollectionView.register(cellNib, forCellWithReuseIdentifier: "DetailImageCollectionViewCell")
    }
}
//MARK: 테이블 뷰 셀 extension
extension DetailImageTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageArray.count
        //return movieVO.popular.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailImageCollectionViewCell", for: indexPath) as? DetailImageCollectionViewCell {
            
            cell.setCell(detailImage: imageArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: detailImageCollectionView.frame.size.width  , height:  detailImageCollectionView.frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("콜렉션 뷰 " + String(indexPath.row))
        
        let cell = collectionView.cellForItem(at: indexPath) as? DetailImageCollectionViewCell
            self.detailImageCellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)

    }
    
    //데이터 가져올 함수
    func setCell(row: Array<DetailImage>)  {
        self.imageArray = row
        self.detailImageCollectionView.reloadData()
    }
}
