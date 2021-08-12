//
//  RealTimeTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//

import UIKit

class RealTimeTableViewCell: UITableViewCell {

    @IBOutlet weak var realTimeCollectionView: UICollectionView!
    
    // 데이터 배열
    var realtimeArray: Array<RealTime> = []
    var cellheight = 1.7
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
        self.realTimeCollectionView.dataSource = self
        self.realTimeCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "RealTimeCollectionViewCell", bundle: nil)
                self.realTimeCollectionView.register(cellNib, forCellWithReuseIdentifier: "RealTimeCollectionViewCell")
    }
}
//MARK: 테이블 뷰 셀 extension
extension RealTimeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return realtimeArray.count
        //return movieVO.popular.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // 컬렉션 뷰 한 줄에 2개가 딱 맞게 정사각형으로 들어가게!
        let width = collectionView.bounds.width / 2.17
        return CGSize(width: width, height: width * CGFloat(cellheight))
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RealTimeCollectionViewCell", for: indexPath) as? RealTimeCollectionViewCell {
            
            cell.setCell(realtime: realtimeArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("콜렉션 뷰 " + String(indexPath.row))
        
        //let cell = collectionView.cellForItem(at: indexPath) as? RealTimeCollectionViewCell
           // self.realTimeCellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)

    }
    
    //데이터 가져올 함수
    func setCell(realtime: Array<RealTime>)  {
        self.realtimeArray = realtime
        self.realTimeCollectionView.reloadData()
    }
    func setHeight(height: Double)  {
        self.cellheight = height
        self.realTimeCollectionView.reloadData()
    }
    
}
