//
//  TodayViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/01.
//

import Foundation
import UIKit
import XLPagerTabStrip

class TodayViewController: BaseViewController, IndicatorInfoProvider, UICollectionViewDelegate, BannerCollectionViewCellDelegate, EventCollectionViewCellDelegate, TodayGoodsCollectionViewCellDelegate{
    
   
    //MARK: - Outlet
    
    // 테이블 뷰
    @IBOutlet weak var tableView: UITableView!
    
    // 데이터 배열
    let dataArray: Array<UIImage> = [ #imageLiteral(resourceName: "배너"), #imageLiteral(resourceName: "배너"), #imageLiteral(resourceName: "배너")]
    let eventArray: Array<UIImage> = [ #imageLiteral(resourceName: "이벤트"),  #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트")]
    let todayGoodsArray: Array<String> = ["천연 수정 크리스탈 원석 은 목걸이","천연 수정 크리스탈 원석 은 목걸이","천연 수정 크리스탈 원석 은 목걸이","천연 수정 크리스탈 원석 은 목걸이","천연 수정 크리스탈 원석 은 목걸이","천연 수정 크리스탈 원석 은 목걸이"]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableview
        setupTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    //MARK: - Helpers
    
    //상단 탭바 연결
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
            return IndicatorInfo(title: "투데이")
    }
    
    //MARK: 상세 페이지로 넘어가기
    
    func goDetailPage(index: Int){
        print("어쩌구")
        let detailStoryboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
        guard let vc = detailStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        vc.data = "\(index)번째 값"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //배너
    func collectionView(collectionviewcell: BannerCollectionViewCell?, index: Int, didTappedInTableViewCell: BannerTableViewCell) {
        goDetailPage(index: index)
    }
    
    // 이벤트
    func collectionView(collectionviewcell: EventCollectionViewCell?, index: Int, didTappedInTableViewCell: EventTableViewCell) {
        goDetailPage(index: index)
    }
    
    // 투데이 상품
    func collectionView(collectionviewcell: TodayGoodsCollectionViewCell?, index: Int, didTappedInTableViewCell: TodayGoodsTableViewCell) {
        goDetailPage(index: index)
    }
}

// 테이블뷰 extension
extension TodayViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as? BannerTableViewCell {
                cell.bannerCellDelegate = self
                cell.setCell(row: dataArray)
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell") as? EventTableViewCell {
                cell.eventCellDelegate = self
                cell.setCell(row: eventArray)
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TodayGoodsTableViewCell") as? TodayGoodsTableViewCell {
                cell.todayGoodsCellDelegate = self
                cell.setCell(row: todayGoodsArray)
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행은 \(indexPath.row) 입니다.")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        case 1:
            return 100
        case 2:
            return 1200
        default:
            return 100
        }
    }
    
    //tableview cell에 들어갈 cell들의 Nib을 등록
    private func setupTableView(){
            // Register the xib for tableview cell
            tableView.delegate = self
            tableView.dataSource = self
        
            let curatingCellNib = UINib(nibName: "BannerTableViewCell", bundle: nil)
            self.tableView.register(curatingCellNib, forCellReuseIdentifier: "BannerTableViewCell")
        
            let eventCellNib = UINib(nibName: "EventTableViewCell", bundle: nil)
            self.tableView.register(eventCellNib, forCellReuseIdentifier: "EventTableViewCell")
        
            let todayGoodsCellNib = UINib(nibName: "TodayGoodsTableViewCell", bundle: nil)
            self.tableView.register(todayGoodsCellNib, forCellReuseIdentifier: "TodayGoodsTableViewCell")
        
            
    }
}
