//
//  NewViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/01.
//

import Foundation
import UIKit
import XLPagerTabStrip

class NewViewController: BaseViewController, IndicatorInfoProvider, HeartDelegate{
    func didSelectedHeartButton(isChecked: Bool) {
        if(isChecked){
            height = 1.0
        }else{
            height = 1.4
        }
        tableView.reloadData()
    }
    
    
    //MARK: - Outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    //실시간 데이터
    var newData: NewResult?
    
    var height = 1.4
    // Datamanager
    lazy var dataManager: NewDataManager = NewDataManager()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        //get data
        dataManager.getNew(vc: self, userIdx: 3, tab: "new")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Helpers
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
            return IndicatorInfo(title: "NEW")
    }
}
extension NewViewController {
    func didSuccessNew(result: NewResponse) {
        newData = result.result
        
        print("DEBUG: 데이터 로딩 성공")
        print(newData!)
        
        tableView.reloadData()
        //print(detailData?.getDetailProdImgRes)
    }
    
    func failedToRequestNew(message: String) {
        print("DEBUG: 데이터 로딩 실패.")
    }
}

// 테이블뷰 extension
extension NewViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "NewTopTableViewCell") as? NewTopTableViewCell {
                //cell.bannerCellDelegate = self
                cell.delegate = self
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewCell") as? NewTableViewCell {
                //cell.bannerCellDelegate = self
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                    cell.setHeight(height: height)
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
            let curatingCellNib = UINib(nibName: "NewTableViewCell", bundle: nil)
            self.tableView.register(curatingCellNib, forCellReuseIdentifier: "NewTableViewCell")
        
        let topCellNib = UINib(nibName: "NewTopTableViewCell", bundle: nil)
        self.tableView.register(topCellNib, forCellReuseIdentifier: "NewTopTableViewCell")
        
        
        
        
    }
}


