//
//  NewTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var newCollectionView: UICollectionView!
    // 데이터 배열
    var newArray: Array<New> = []
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
        self.newCollectionView.dataSource = self
        self.newCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "NewCollectionViewCell", bundle: nil)
                self.newCollectionView.register(cellNib, forCellWithReuseIdentifier: "NewCollectionViewCell")
    }
}
//MARK: 테이블 뷰 셀 extension
extension NewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return newArray.count
        //return movieVO.popular.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // 컬렉션 뷰 한 줄에 2개가 딱 맞게 정사각형으로 들어가게!
        let width = collectionView.bounds.width / 2.17
        return CGSize(width: width, height: width * 1.4)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCollectionViewCell", for: indexPath) as? NewCollectionViewCell {
            
            cell.setCell(new: newArray[indexPath.row])
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
    func setCell(new: Array<New>)  {
        self.newArray = new
        self.newCollectionView.reloadData()
    }
}
