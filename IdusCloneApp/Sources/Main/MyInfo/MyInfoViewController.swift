//
//  MyInfoViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/08.
//
import UIKit
import Foundation
class MyInfoViewController: BaseViewController{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupTableView()
    }
    
    func configureUI() {
        // #imageLiteral(resourceName: "상단_종")
        let btnChat = UIBarButtonItem(image: #imageLiteral(resourceName: "상단_채팅"), style: .plain, target: self, action: #selector(moveChat))
        let btnAlarm = UIBarButtonItem(image:#imageLiteral(resourceName: "상단_종"), style: .plain, target: self, action: #selector(moveAlarm))
        let btnCart = UIBarButtonItem(image: #imageLiteral(resourceName: "상단_장바구니"), style: .plain, target: self, action: #selector(moveCart))
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1960550249, green: 0.1960947514, blue: 0.1960498393, alpha: 1)
        navigationItem.rightBarButtonItems = [btnCart, btnAlarm, btnChat]
        let btnInfo = UIBarButtonItem(title: "내 정보", style: .plain, target: self, action: #selector(moveInfo))
        navigationItem.leftBarButtonItem = btnInfo
    }
    @objc func moveChat() {
        
    }
    @objc func moveAlarm() {
        
    }
    @objc func moveCart() {
    }
    
    @objc func moveInfo() {
    }
}
// 테이블뷰 extension
extension MyInfoViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoProfileTableViewCell") as? MyInfoProfileTableViewCell {
                //cell.bannerCellDelegate = self
                /*
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                }*/
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoExtraTableViewCell") as? MyInfoExtraTableViewCell {
                //cell.bannerCellDelegate = self
                /*
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                }*/
                return cell
            }
        case 1,3,5,7,9:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "LineTableViewCell") as? LineTableViewCell {
                //cell.bannerCellDelegate = self
                /*
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                }*/
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoBannerTableViewCell") as? MyInfoBannerTableViewCell {
                //cell.bannerCellDelegate = self
                /*
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                }*/
                return cell
            }
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoRecentTableViewCell") as? MyInfoRecentTableViewCell {
                //cell.bannerCellDelegate = self
                /*
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                }*/
                return cell
            }
        case 8:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoNoticeTableViewCell") as? MyInfoNoticeTableViewCell {
                //cell.bannerCellDelegate = self
                /*
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                }*/
                return cell
            }
        case 10:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoAboutIdusTableViewCell") as? MyInfoAboutIdusTableViewCell {
                //cell.bannerCellDelegate = self
                /*
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                }*/
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
            return 374
        case 1,3,5,7,9:
            return 15
        case 2:
            return 310
        case 4:
            return 92
        case 6:
            return 316
        case 8:
            return 235
        case 10:
            return 328
        default:
            return 0
        }
    }
    
    //tableview cell에 들어갈 cell들의 Nib을 등록
    private func setupTableView(){
            // Register the xib for tableview cell
            tableView.delegate = self
            tableView.dataSource = self
            
        //장바구니
          
        
        let myInfoProfileCellNib = UINib(nibName: "MyInfoProfileTableViewCell", bundle: nil)
        self.tableView.register(myInfoProfileCellNib, forCellReuseIdentifier: "MyInfoProfileTableViewCell")
        
        let myInfoExtraCellNib = UINib(nibName: "MyInfoExtraTableViewCell", bundle: nil)
        self.tableView.register(myInfoExtraCellNib, forCellReuseIdentifier: "MyInfoExtraTableViewCell")
        let lineCellNib = UINib(nibName: "LineTableViewCell", bundle: nil)
        self.tableView.register(lineCellNib, forCellReuseIdentifier: "LineTableViewCell")
        
        let myInfoBannerCellNib = UINib(nibName: "MyInfoBannerTableViewCell", bundle: nil)
        self.tableView.register(myInfoBannerCellNib, forCellReuseIdentifier: "MyInfoBannerTableViewCell")
        
        let myInfoNoticeCellNib = UINib(nibName: "MyInfoNoticeTableViewCell", bundle: nil)
        self.tableView.register(myInfoNoticeCellNib, forCellReuseIdentifier: "MyInfoNoticeTableViewCell")
        
        let myInfoAboutIdusCellNib = UINib(nibName: "MyInfoAboutIdusTableViewCell", bundle: nil)
        self.tableView.register(myInfoAboutIdusCellNib, forCellReuseIdentifier: "MyInfoAboutIdusTableViewCell")
        
        let myInfoRecentIdusCellNib = UINib(nibName: "MyInfoRecentTableViewCell", bundle: nil)
        self.tableView.register(myInfoRecentIdusCellNib, forCellReuseIdentifier: "MyInfoRecentTableViewCell")
        
    }
}
