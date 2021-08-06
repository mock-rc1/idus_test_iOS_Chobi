//
//  TodayGoodsTableViewCell.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/02.
//
import Foundation
import UIKit

//MARK: Protocol
protocol TodayGoodsCollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: TodayGoodsCollectionViewCell?, index: Int, didTappedInTableViewCell: TodayGoodsTableViewCell)
}

class TodayGoodsTableViewCell: UITableViewCell{
    
    //MARK: - Outlet
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var btnMoreGoods: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    
    // 투데이 콜렉션 뷰
    @IBOutlet weak var todayGoodsCollectionView: UICollectionView!
    
    // 데이터 배열
    var todayGoodsArray: Array<TodayGoods> = []
    var todayRealtimeArray: Array<TodayRealtime> = []
    var index = 0
    // 프로토콜 변수
    
    weak var todayGoodsCellDelegate: TodayGoodsCollectionViewCellDelegate?
    
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
        self.todayGoodsCollectionView.dataSource = self
        self.todayGoodsCollectionView.delegate = self
        
        let cellNib = UINib(nibName: "TodayGoodsCollectionViewCell", bundle: nil)
                self.todayGoodsCollectionView.register(cellNib, forCellWithReuseIdentifier: "TodayGoodsCollectionViewCell")
    }
}

//MARK: 테이블 뷰 셀 extension
extension TodayGoodsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return todayGoodsArray.count
        //return movieVO.popular.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // 컬렉션 뷰 한 줄에 2개가 딱 맞게 정사각형으로 들어가게!
        let width = collectionView.bounds.width / 2.17
        return CGSize(width: width, height: width * 1.85)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayGoodsCollectionViewCell", for: indexPath) as? TodayGoodsCollectionViewCell {
            
            cell.setCell( todayGoods: todayGoodsArray[indexPath.row],todayRealtime: todayRealtimeArray[indexPath.row], index: index)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("콜렉션 뷰 " + String(indexPath.row))
        
        let cell = collectionView.cellForItem(at: indexPath) as? TodayGoodsCollectionViewCell
            self.todayGoodsCellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)

    }
    
    //데이터 가져올 함수
    func setCell(goods: Array<TodayGoods>, realtime: Array<TodayRealtime>, index: Int)  {
        self.index = index
        self.todayGoodsArray = goods
        self.todayRealtimeArray = realtime
        self.todayGoodsCollectionView.reloadData()
    }
}
