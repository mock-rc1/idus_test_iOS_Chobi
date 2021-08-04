//
//  DetailKeywordTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/04.
//

import UIKit

class DetailKeywordTableViewCell: UITableViewCell {

    @IBOutlet weak var keywordCollectionView: UICollectionView!
    
    let keywordArray : Array<String> = ["진주", "담수진주", "진주목걸이", "얼스룩", "빈티지목걸이","써지컬목걸이", "레이어드목걸이", "진주체인목걸이", "클래습", "하객룩"]
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
        self.keywordCollectionView.dataSource = self
        self.keywordCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "DetailKeywordCollectionViewCell", bundle: nil)
                self.keywordCollectionView.register(cellNib, forCellWithReuseIdentifier: "DetailKeywordCollectionViewCell")
    }
}

//MARK: 테이블 뷰 셀 extension
extension DetailKeywordTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return keywordArray.count
        //return movieVO.popular.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // 컬렉션 뷰 한 줄에 2개가 딱 맞게 정사각형으로 들어가게!
        let width: Int
        if(keywordArray[indexPath.row].count < 5 ){
            width = keywordArray[indexPath.row].count * 20
        }else{
            width = keywordArray[indexPath.row].count * 20 - 10
        }
        
        //let height = keywordCollectionView.bounds.height
        
        return CGSize(width: width, height: 32)
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailKeywordCollectionViewCell", for: indexPath) as? DetailKeywordCollectionViewCell {
                //cell.setCell(todayGoods: todayGoodsArray[indexPath.row])
            cell.labelTag.text = "#" + keywordArray[indexPath.row]
                return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
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
