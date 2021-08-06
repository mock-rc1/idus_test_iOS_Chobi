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
    
    // Datamanager
    lazy var dataManager: TodayDataManager = TodayDataManager()
    
    //투데이 데이터
    var todayData: TodayResult?
    
    // 데이터 배열
    let dataArray: Array<UIImage> = [ #imageLiteral(resourceName: "배너"), #imageLiteral(resourceName: "배너"), #imageLiteral(resourceName: "배너")]
    let eventArray: Array<UIImage> = [ #imageLiteral(resourceName: "이벤트"),  #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트"), #imageLiteral(resourceName: "이벤트")]
    let todayGoodsArray: Array<String> = ["천연 수정 크리스탈 원석 은 목걸이","천연 수정 크리스탈 원석 은 목걸이","천연 수정 크리스탈 원석 은 목걸이","천연 수정 크리스탈 원석 은 목걸이","천연 수정 크리스탈 원석 은 목걸이","천연 수정 크리스탈 원석 은 목걸이"]
    
    // 타이머 시간
    var timer = 0
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableview
        setupTableView()
        saleTimer()
        
        //get data
        dataManager.getToday(vc: self, userIdx: 3, tab: "today")
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
    
    //할인 타이머
    func saleTimer() {
           let _: Timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (Timer) in
            self.addTime()
            
        }
    }
    func addTime() {
        timer += 1
        tableView.reloadData()
    }
}

// 테이블뷰 extension
extension TodayViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 6
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
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TodayRelatedTableViewCell") as? TodayRelatedTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TodayGoodsTableViewCell") as? TodayGoodsTableViewCell {
                cell.todayGoodsCellDelegate = self
                cell.setCell(row: todayGoodsArray)
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TodaySaleTableViewCell") as? TodaySaleTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                if let arr = cell.labelTimer.text?.components(separatedBy: ":"){
                    cell.labelTimer.text = "\(arr[0]):\(arr[1]):\(String(Int(arr[2])! - 1))"
                }
                
                return cell
            }
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TodayGoodsTableViewCell") as? TodayGoodsTableViewCell {
                cell.todayGoodsCellDelegate = self
                cell.setCell(row: todayGoodsArray)
                cell.labelTitle.text = "실시간 구매"
                cell.btnMoreGoods.setTitle("실시간 작품 더보기 >", for: .normal)
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
            return 380
        case 3:
            return 1200
        case 4:
            return 700
        case 5:
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
            
        //배너
            let curatingCellNib = UINib(nibName: "BannerTableViewCell", bundle: nil)
            self.tableView.register(curatingCellNib, forCellReuseIdentifier: "BannerTableViewCell")
        
        //이벤트
            let eventCellNib = UINib(nibName: "EventTableViewCell", bundle: nil)
            self.tableView.register(eventCellNib, forCellReuseIdentifier: "EventTableViewCell")
        
        //연관 작품
        let todayRelatedCellNib = UINib(nibName: "TodayRelatedTableViewCell", bundle: nil)
        self.tableView.register(todayRelatedCellNib, forCellReuseIdentifier: "TodayRelatedTableViewCell")
        
        //오늘의 작품
            let todayGoodsCellNib = UINib(nibName: "TodayGoodsTableViewCell", bundle: nil)
            self.tableView.register(todayGoodsCellNib, forCellReuseIdentifier: "TodayGoodsTableViewCell")
        
            //할인
            let todaySaleCellNib = UINib(nibName: "TodaySaleTableViewCell", bundle: nil)
            self.tableView.register(todaySaleCellNib, forCellReuseIdentifier: "TodaySaleTableViewCell")
        
        
    }
}

extension TodayViewController {
    func didSuccessToday(result: TodayResponse) {
        todayData = result.result
        
        print("DEBUG: 데이터 로딩 성공")
        print(todayData!)
        
        tableView.reloadData()
        //print(detailData?.getDetailProdImgRes)
    }
    
    func failedToRequest(message: String) {
        print("DEBUG: 데이터 로딩 실패.")
    }
}
