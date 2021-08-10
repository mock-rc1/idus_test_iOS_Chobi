//
//  ClassOnlineViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/09.
//

import Foundation
import UIKit
import XLPagerTabStrip
class ClassOnlineViewController: UIViewController,IndicatorInfoProvider {

    @IBOutlet weak var tableView: UITableView!
    // #imageLiteral(resourceName: "마이클래스5")
    // 이벤트 아이콘
    let eventTextArray: Array<String> = ["취미클래스", "활용만점취미", "원데이클래스", "퇴근후취미", "키즈문센", "투잡가능취미" , "디지털드로잉","작가캐스팅"]
    let eventArray: Array<UIImage> = [ #imageLiteral(resourceName: "취미클래스") , #imageLiteral(resourceName: "활용만점취미"), #imageLiteral(resourceName: "원데이클래스"), #imageLiteral(resourceName: "퇴근후취미") , #imageLiteral(resourceName: "키즈문센"), #imageLiteral(resourceName: "투잡가능취미"), #imageLiteral(resourceName: "디지털드로잉"), #imageLiteral(resourceName: "작가캐스팅")]
    
    let bannerArray: Array<UIImage> = [#imageLiteral(resourceName: "클래스_배너1"),#imageLiteral(resourceName: "클래스_배너2"),#imageLiteral(resourceName: "클래스_배너3"),#imageLiteral(resourceName: "클래스_배너4"),#imageLiteral(resourceName: "클래스_배너5")]
    
    let myclassArray: Array<UIImage> = [#imageLiteral(resourceName: "마이클래스1"),#imageLiteral(resourceName: "마이클래스2"),#imageLiteral(resourceName: "마이클래스3"), #imageLiteral(resourceName: "마이클래스4"), #imageLiteral(resourceName: "마이클래스5")  ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "온라인")
      }
}
// 테이블뷰 extension
extension ClassOnlineViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ClassOnlineBannerTableViewCell") as? ClassOnlineBannerTableViewCell {
                //cell.bannerCellDelegate = self
                cell.setCell(row: bannerArray)
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ClassEventTableViewCell") as? ClassEventTableViewCell {
                //cell.eventCellDelegate = self
                cell.setCell(event: eventArray, eventText: eventTextArray)
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassTableViewCell") as? MyClassTableViewCell {
                //cell.eventCellDelegate = self
                cell.setCell(event: myclassArray)
                return cell
            }
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ClassLineTableViewCell") as? ClassLineTableViewCell {
                //cell.eventCellDelegate = self
                //cell.setCell(event: myclassArray)
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
        case 2,4:
            return 50
        case 3:
            return 169
        case 5:
            return 100
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
            let curatingCellNib = UINib(nibName: "ClassOnlineBannerTableViewCell", bundle: nil)
            self.tableView.register(curatingCellNib, forCellReuseIdentifier: "ClassOnlineBannerTableViewCell")
        //이벤트
            let eventCellNib = UINib(nibName: "ClassEventTableViewCell", bundle: nil)
            self.tableView.register(eventCellNib, forCellReuseIdentifier: "ClassEventTableViewCell")
       
        //마이클래스
            let myclassCellNib = UINib(nibName: "MyClassTableViewCell", bundle: nil)
            self.tableView.register(myclassCellNib, forCellReuseIdentifier: "MyClassTableViewCell")
        // 여백
        let lineCellNib = UINib(nibName: "ClassLineTableViewCell", bundle: nil)
        self.tableView.register(lineCellNib, forCellReuseIdentifier: "ClassLineTableViewCell")
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

