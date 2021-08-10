//
//  ClassOfflineViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/09.
//

import Foundation
import UIKit
import XLPagerTabStrip
class ClassOfflineViewController: UIViewController,IndicatorInfoProvider {
//#imageLiteral(resourceName: "클래스_부산")
    let bannerArray: Array<UIImage> = [#imageLiteral(resourceName: "클래스_서울남부"),#imageLiteral(resourceName: "클래스_서울동부") , #imageLiteral(resourceName: "클래스_서울서부") ,#imageLiteral(resourceName: "클래스_서울북부") ,#imageLiteral(resourceName: "클래스_부산")]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "오프라인")
      }
}
// 테이블뷰 extension
extension ClassOfflineViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ClassOfflineBannerTableViewCell") as? ClassOfflineBannerTableViewCell {
                //cell.bannerCellDelegate = self
                cell.setCell(row: bannerArray)
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCategoryTableViewCell") as? ClassCategoryTableViewCell {
                //cell.bannerCellDelegate = self
                //cell.setCell(row: bannerArray)
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
            return 350
        case 1:
            return 290
                
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
            let curatingCellNib = UINib(nibName: "ClassOfflineBannerTableViewCell", bundle: nil)
            self.tableView.register(curatingCellNib, forCellReuseIdentifier: "ClassOfflineBannerTableViewCell")
        
       // 카테고리
        let categoryCellNib = UINib(nibName: "ClassCategoryTableViewCell", bundle: nil)
        self.tableView.register(categoryCellNib, forCellReuseIdentifier: "ClassCategoryTableViewCell")
        
        
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

