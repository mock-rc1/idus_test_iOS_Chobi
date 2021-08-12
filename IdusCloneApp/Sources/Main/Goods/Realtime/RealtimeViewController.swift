//
//  RealtimeViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/01.
//

import Foundation
import UIKit
import XLPagerTabStrip

class RealtimeViewController: BaseViewController, IndicatorInfoProvider{
    
    //MARK: - Outlet
    var onlyImage = false
    //실시간 데이터
    var realtimeData: RealtimeResult?
    
    @IBOutlet weak var tableView: UITableView!
    
    // Datamanager
    lazy var dataManager: RealtimeDataManager = RealtimeDataManager()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        //get data
        dataManager.getRealtime(vc: self, userIdx: 3, tab: "now")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    //MARK: - Helpers
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
            return IndicatorInfo(title: "실시간")
    }
}

extension RealtimeViewController {
    func didSuccessToday(result: RealtimeResponse) {
        realtimeData = result.result
        
        print("DEBUG: 데이터 로딩 성공")
        print(realtimeData!)
        
        tableView.reloadData()
        //print(detailData?.getDetailProdImgRes)
    }
    
    func failedToRequest(message: String) {
        print("DEBUG: 데이터 로딩 실패.")
    }
}

// 테이블뷰 extension
extension RealtimeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "RealTimeTopTableViewCell") as? RealTimeTopTableViewCell {
                //cell.bannerCellDelegate = self
                
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "RealTimeTableViewCell") as? RealTimeTableViewCell {
                //cell.bannerCellDelegate = self
                if let x = realtimeData?.getNowOrderRes{
                    cell.setCell(realtime: x)
                }
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
            return 76
        case 1:
            return 3000
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
            let curatingCellNib = UINib(nibName: "RealTimeTableViewCell", bundle: nil)
            self.tableView.register(curatingCellNib, forCellReuseIdentifier: "RealTimeTableViewCell")
        
        let topCellNib = UINib(nibName: "RealTimeTopTableViewCell", bundle: nil)
        self.tableView.register(topCellNib, forCellReuseIdentifier: "RealTimeTopTableViewCell")
        
        
        
        
    }
}

extension RealtimeViewController {
    func didSuccessRealtime(result: RealtimeResponse) {
        realtimeData = result.result
        
        print("DEBUG: 데이터 로딩 성공")
        print(realtimeData!)
        
        tableView.reloadData()
        //print(detailData?.getDetailProdImgRes)
    }
    
    func failedToRequestRealtime(message: String) {
        print("DEBUG: 데이터 로딩 실패.")
    }
}
