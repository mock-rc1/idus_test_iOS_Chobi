//
//  DetailWithGoodsTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/04.
//

import UIKit

class DetailWithGoodsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var withCollectionView: UICollectionView!
    
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var labelTitle: UILabel!
    // 데이터 배열
    var withArray: Array<DetailWithGoods> = []
    var hotArray: Array<DetailHotGoods> = []
    var index : Int = -1
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
        self.withCollectionView.dataSource = self
        self.withCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "DetailWithCollectionViewCell", bundle: nil)
                self.withCollectionView.register(cellNib, forCellWithReuseIdentifier: "DetailWithCollectionViewCell")
    }
}
//MARK: 테이블 뷰 셀 extension
extension DetailWithGoodsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return withArray.count
        //return movieVO.popular.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // 컬렉션 뷰 한 줄에 2개가 딱 맞게 정사각형으로 들어가게!
        let width = collectionView.bounds.width / 3.2
        return CGSize(width: width, height: width * 1.5)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailWithCollectionViewCell", for: indexPath) as? DetailWithCollectionViewCell {
            
            cell.setCell(detailWith: withArray[indexPath.row], detailHot: hotArray[indexPath.row],index: index)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("콜렉션 뷰 " + String(indexPath.row))
        
        //let cell = collectionView.cellForItem(at: indexPath) as? TodayGoodsCollectionViewCell
            //self.todayGoodsCellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)

    }
    
    //데이터 가져올 함수
    func setCell(with: Array<DetailWithGoods>,hot: Array<DetailHotGoods>, i: Int)  {
        self.withArray = with
        self.hotArray = hot
        self.index = i
        if(index != 1){
            labelTitle.text = "인기 작품"
            btnMore.setTitle("인기 작품 더보기", for: .normal)
        }else{
            labelTitle.text = "이 작품과 함께 본 작품"
            btnMore.setTitle("이 작품과 함께 본 작품 더보기", for: .normal)
        }
        self.withCollectionView.reloadData()
    }
}
