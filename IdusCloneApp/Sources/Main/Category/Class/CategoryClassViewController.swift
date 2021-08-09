//
//  CategoryClassViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/09.
//

import UIKit
import XLPagerTabStrip
class CategoryClassViewController: UIViewController,IndicatorInfoProvider {

    
    @IBOutlet weak var tableView: UITableView!
    var isFolded = [false, false]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.reloadData()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "클래스")
      }
}
// 테이블뷰 extension
extension CategoryClassViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryClassTopTableViewCell") as? CategoryClassTopTableViewCell {
                //cell.bannerCellDelegate = self
                cell.labelTitle.text = "전체 카테고리"
                if(isFolded[0]){
                    cell.imageFolder.image = #imageLiteral(resourceName: "folderUp")
                }else{
                    cell.imageFolder.image = #imageLiteral(resourceName: "folder")
                }
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AllCategoryTableViewCell") as? AllCategoryTableViewCell {
                
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryClassTopTableViewCell") as? CategoryClassTopTableViewCell {
                cell.labelTitle.text = "지역별"
                if(isFolded[1]){
                    cell.imageFolder.image = #imageLiteral(resourceName: "folderUp")
                }else{
                    cell.imageFolder.image = #imageLiteral(resourceName: "folder")
                }
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AllLocationTableViewCell") as? AllLocationTableViewCell {
                
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행은 \(indexPath.row) 입니다.")
        if(indexPath.row == 0){
            if(isFolded[0]){
                isFolded[0] = false
            }else{
                isFolded[0] = true
            }
            tableView.reloadData()
        }else if(indexPath.row == 2){
            if(isFolded[1]){
                isFolded[1] = false
            }else{
                isFolded[1] = true
            }
            tableView.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 44
        case 1:
            if(isFolded[0] == false){
                return 214
            }else{
                return 0
            }
        case 2:
            return 44
        case 3:
            if(isFolded[1] == false){
                return 426
            }else{
                return 0
            }
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
          
        
        let topCellNib = UINib(nibName: "CategoryClassTopTableViewCell", bundle: nil)
        self.tableView.register(topCellNib, forCellReuseIdentifier: "CategoryClassTopTableViewCell")
        
        let allCategoryCellNib = UINib(nibName: "AllCategoryTableViewCell", bundle: nil)
        self.tableView.register(allCategoryCellNib, forCellReuseIdentifier: "AllCategoryTableViewCell")
        
        
        let allLocationCellNib = UINib(nibName: "AllLocationTableViewCell", bundle: nil)
        self.tableView.register(allLocationCellNib, forCellReuseIdentifier: "AllLocationTableViewCell")
        
    }
}
