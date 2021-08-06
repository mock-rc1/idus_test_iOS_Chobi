//
//  TodaySaleTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/06.
//

import UIKit
import MSPeekCollectionViewDelegateImplementation

class TodaySaleTableViewCell: UITableViewCell , UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelTimer: UILabel!
    
    @IBOutlet weak var todaySaleCollectionView: UICollectionView!
    
    // 데이터 배열
    var todayArray: Array<UIImage> = []
    
    // 스크롤
    let behavior = MSCollectionViewPeekingBehavior()
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
        self.todaySaleCollectionView.dataSource = self
        self.todaySaleCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "TodaySaleCollectionViewCell", bundle: nil)
                self.todaySaleCollectionView.register(cellNib, forCellWithReuseIdentifier: "TodaySaleCollectionViewCell")
        behavior.cellSpacing = 2
        behavior.cellPeekWidth = 17
        behavior.numberOfItemsToShow = 1
        todaySaleCollectionView.configureForPeekingBehavior(behavior: behavior)
    }
}
//MARK: 테이블 뷰 셀 extension
extension TodaySaleTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
        //return movieVO.popular.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodaySaleCollectionViewCell", for: indexPath) as? TodaySaleCollectionViewCell {
            
            //cell.setCell(event: eventArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("콜렉션 뷰 " + String(indexPath.row))
        
        //let cell = collectionView.cellForItem(at: indexPath) as? EventCollectionViewCell
           // self.eventCellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)

    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        behavior.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    /*
    //데이터 가져올 함수
    func setCell(row: Array<UIImage>)  {
        self.eventArray = row
        self.eventCollectionView.reloadData()
    }*/
}
