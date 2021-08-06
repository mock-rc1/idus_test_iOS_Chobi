//
//  TodayRelatedTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/06.
//

import UIKit
import MSPeekCollectionViewDelegateImplementation

class TodayRelatedTableViewCell: UITableViewCell {

    @IBOutlet weak var todayRelatedCollectionView: UICollectionView!
    // 스크롤
    let behavior = MSCollectionViewPeekingBehavior()
    
    var relatedArray: Array<TodayRelated> = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setNib()  {
        self.todayRelatedCollectionView.dataSource = self
        self.todayRelatedCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "TodayRelatedCollectionViewCell", bundle: nil)
                self.todayRelatedCollectionView.register(cellNib, forCellWithReuseIdentifier: "TodayRelatedCollectionViewCell")
        behavior.cellSpacing = 2
        behavior.cellPeekWidth = 17
        behavior.numberOfItemsToShow = 2
        todayRelatedCollectionView.configureForPeekingBehavior(behavior: behavior)
    }
}

//MARK: 테이블 뷰 셀 extension
extension TodayRelatedTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return relatedArray.count
        //return movieVO.popular.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayRelatedCollectionViewCell", for: indexPath) as? TodayRelatedCollectionViewCell {
            
            cell.setCell(todayRelated: relatedArray[indexPath.row])
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
    
    //데이터 가져올 함수
    func setCell(row: Array<TodayRelated>)  {
        self.relatedArray = row
        self.todayRelatedCollectionView.reloadData()
    }
}
