//
//  TodayViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/01.
//

import Foundation
import UIKit
import XLPagerTabStrip

class TodayViewController: BaseViewController, IndicatorInfoProvider, UICollectionViewDelegate, BannerCollectionViewCellDelegate, EventCollectionViewCellDelegate, TodayGoodsCollectionViewCellDelegate, TodayRelatedCollectionViewCellDelegate, TodaySaleCollectionViewCellDelegate{
    
   
    //MARK: - Outlet
    
    // 테이블 뷰
    @IBOutlet weak var tableView: UITableView!
    
    // Datamanager
    lazy var dataManager: TodayDataManager = TodayDataManager()
    
    //투데이 데이터
    var todayData: TodayResult?
    
    // 이벤트 아이콘
    let eventTextArray: Array<String> = ["반값줍줍", "이벤트", "휴가꿀템", "취미클래스", "지금할인중", "써머스타일링" , "제로웨이스트", "비건","남성잇템", "친구초대쿠폰"]
    let eventArray: Array<UIImage> = [ #imageLiteral(resourceName: "반값줍줍"), #imageLiteral(resourceName: "BEST선물"), #imageLiteral(resourceName: "휴가꿀템"), #imageLiteral(resourceName: "취미클래스"), #imageLiteral(resourceName: "지금할인중"), #imageLiteral(resourceName: "써머스타일링"), #imageLiteral(resourceName: "제로웨이스트"), #imageLiteral(resourceName: "비건"), #imageLiteral(resourceName: "남성잇템"), #imageLiteral(resourceName: "친구초대쿠폰")]
    
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
        setCustomNavigationBar()
    }
    //MARK: - Helpers
    
    //상단 탭바 연결
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
            return IndicatorInfo(title: "투데이")
    }
    // 내비게이션 바 디자인
    func setCustomNavigationBar() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        //#imageLiteral(resourceName: "아이디어스로고2")
        let image = #imageLiteral(resourceName: "아이디어스로고2")
        imageView.image = image
        navigationItem.titleView = imageView
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "무료배송을 검색해보세요."
        searchController.searchBar.backgroundColor = UIColor.white
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor.white

        
        self.navigationItem.searchController = searchController
        //self.navigationItem.title = "아이디어스"
        //searchController.hidesNavigationBarDuringPresentation = true
        searchController.automaticallyShowsCancelButton = false
    }
    //MARK: 상세 페이지로 넘어가기
    
    func goDetailPage(index: Int, prodIdx: Int){
        //print("어쩌구")
        let detailStoryboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
        guard let vc = detailStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        vc.data = "\(index)번째 값"
        vc.prodIdx = prodIdx
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //배너
    func collectionView(collectionviewcell: BannerCollectionViewCell?, index: Int, didTappedInTableViewCell: BannerTableViewCell) {
        let todayStoryboard = UIStoryboard(name: "TodayStoryboard", bundle: nil)
        guard let vc = todayStoryboard.instantiateViewController(withIdentifier: "BannerViewController") as? BannerViewController else { return }
        vc.index = index
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // 이벤트
    func collectionView(collectionviewcell: EventCollectionViewCell?, index: Int, didTappedInTableViewCell: EventTableViewCell) {
        let todayStoryboard = UIStoryboard(name: "TodayStoryboard", bundle: nil)
        guard let vc = todayStoryboard.instantiateViewController(withIdentifier: "EventViewController") as? EventViewController else { return }
        vc.index = index
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //나와 연관된 상품
    func collectionView(collectionviewcell: TodayRelatedCollectionViewCell?, index: Int, didTappedInTableViewCell: TodayRelatedTableViewCell) {
        if let x=todayData{
            goDetailPage(index: index, prodIdx: x.getVisitAlikeRes[index].prodIdx!)
        }
       
    }
    
    // 투데이 상품
    func collectionView(collectionviewcell: TodayGoodsCollectionViewCell?, index: Int, didTappedInTableViewCell: TodayGoodsTableViewCell) {
        print("둘중에\(didTappedInTableViewCell.index)")
        if let x=todayData{
            if(didTappedInTableViewCell.index == 1){
                goDetailPage(index: index, prodIdx: x.getTodayProdRes[index].prodIdx!)
            }else{
                goDetailPage(index: index, prodIdx: x.getRecOrderRes[index].prodIdx!)
            }
        }
       
    }
    
    // 할인 상품
    func collectionView(collectionviewcell: TodaySaleCollectionViewCell?, index: Int, didTappedInTableViewCell: TodaySaleTableViewCell) {
        if let x=todayData{
            goDetailPage(index: index, prodIdx: x.getDisProdRes[index].prodIdx!)
        }
       
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as? BannerTableViewCell {
                cell.bannerCellDelegate = self
                if let x = todayData{
                    cell.setCell(row: x.getBannerRes)
                }
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell") as? EventTableViewCell {
                cell.eventCellDelegate = self
                cell.setCell(event: eventArray, eventText: eventTextArray)
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TodayRelatedTableViewCell") as? TodayRelatedTableViewCell {
                cell.todayRelatedCellDelegate = self
                if let x = todayData{
                    cell.setCell(row: x.getVisitAlikeRes)
                }
                return cell
            }
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TodayGoodsTableViewCell") as? TodayGoodsTableViewCell {
                cell.todayGoodsCellDelegate = self
                if let x = todayData{
                    cell.setCell(goods: x.getTodayProdRes, realtime: x.getRecOrderRes, index: 1)
                }
                
                cell.labelTitle.text = "오늘의 작품"
                cell.btnMoreGoods.setTitle("오늘의 작품 더보기 >", for: .normal)
                return cell
            }
        case 7:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TodaySaleTableViewCell") as? TodaySaleTableViewCell {
                cell.todaySaleCellDelegate = self
                if let x = todayData{
                    cell.setCell(row: x.getDisProdRes)
                }
                if let arr = cell.labelTimer.text?.components(separatedBy: ":"){
                    if(Int(arr[2]) == 0){
                        cell.labelTimer.text = "\(arr[0]):\(String(Int(arr[1])! - 1)):59"
                    }else{
                        cell.labelTimer.text = "\(arr[0]):\(arr[1]):\(String(Int(arr[2])! - 1))"
                    }
                    
                }
                
                return cell
            }
        case 9:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TodayGoodsTableViewCell") as? TodayGoodsTableViewCell {
                cell.todayGoodsCellDelegate = self
                if let x = todayData{
                    cell.setCell(goods: x.getTodayProdRes, realtime: x.getRecOrderRes, index: 0)
                }
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
        case 2,4,6,8:
            return 50
        case 3:
            return 380
            //
        case 5:
            return 1200
            //
        case 7:
            return 700
            //
        case 9:
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
    /*
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        print(indexPath.row)
            if indexPath.row  < 2{
                print("you reached start of the table")
                self.navigationController?.isNavigationBarHidden = true
            }else{
                self.navigationController?.isNavigationBarHidden = false
            }
        }*/
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
