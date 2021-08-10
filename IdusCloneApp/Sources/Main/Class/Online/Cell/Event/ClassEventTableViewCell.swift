//
//  ClassEventTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/10.
//

import UIKit
import MSPeekCollectionViewDelegateImplementation

class ClassEventTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var eventCollectionView: UICollectionView!
    // 데이터 배열
    var eventArray: Array<UIImage> = []
    var eventTextArray: Array<String> = []
    
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
        self.eventCollectionView.dataSource = self
        self.eventCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "ClassEventCollectionViewCell", bundle: nil)
                self.eventCollectionView.register(cellNib, forCellWithReuseIdentifier: "ClassEventCollectionViewCell")
        behavior.cellSpacing = 2
        behavior.cellPeekWidth = 17
        behavior.numberOfItemsToShow = 5
        eventCollectionView.configureForPeekingBehavior(behavior: behavior)
    }
}
//MARK: 테이블 뷰 셀 extension
extension ClassEventTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return eventArray.count
        //return movieVO.popular.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClassEventCollectionViewCell", for: indexPath) as? ClassEventCollectionViewCell {
            
            cell.setCell(event: eventArray[indexPath.row], eventText: eventTextArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("콜렉션 뷰 " + String(indexPath.row))
        
        //let cell = collectionView.cellForItem(at: indexPath) as? EventCollectionViewCell
            //self.eventCellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)

    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        behavior.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
    //데이터 가져올 함수
    func setCell(event: Array<UIImage>, eventText: Array<String>)  {
        self.eventArray = event
        self.eventTextArray = eventText
        self.eventCollectionView.reloadData()
    }
}
