//
//  BannerTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/01.
//

import UIKit
import MSPeekCollectionViewDelegateImplementation
import SDWebImage
import Alamofire

//MARK: Protocol
protocol BannerCollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: BannerCollectionViewCell?, index: Int, didTappedInTableViewCell: BannerTableViewCell)
}

class BannerTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Outlet
    
    // 현재페이지 체크 변수 (자동 스크롤할 때 필요)
    var nowPage: Int = 0

    // 데이터 배열
    var dataArray: Array<UIImage> = []
    
    //배너 콜렉션 뷰
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    //프로토콜 변수
    weak var bannerCellDelegate: BannerCollectionViewCellDelegate?
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Initialization code
        
    }
    
    //MARK: - Helpers
    func setNib()  {
        self.bannerCollectionView.dataSource = self
        self.bannerCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
                self.bannerCollectionView.register(cellNib, forCellWithReuseIdentifier: "BannerCollectionViewCell")
    }
}

//MARK: 테이블 뷰 셀 extension
extension BannerTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArray.count
        //return movieVO.popular.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell {
            
            cell.setCell(banner: dataArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: bannerCollectionView.frame.size.width  , height:  bannerCollectionView.frame.height)
    }
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }*/
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("콜렉션 뷰 " + String(indexPath.row))
        
        let cell = collectionView.cellForItem(at: indexPath) as? BannerCollectionViewCell
            self.bannerCellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)

    }
    
    //데이터 가져올 함수
    func setCell(row: Array<UIImage>)  {
        self.dataArray = row
        self.bannerCollectionView.reloadData()
    }
}
