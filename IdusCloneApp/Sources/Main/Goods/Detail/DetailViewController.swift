//
//  DetailViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/02.
//
import UIKit
class DetailViewController: BaseViewController{
    //MARK: - Outlet
    
    //테이블 뷰
    @IBOutlet weak var tableView: UITableView!
    
    //몇 번째 값인지
    var data: String?
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentAlert(title: data!)
        configureNavi()
        print(UITabBarController().tabBar.frame.height)
        self.tabBarController?.tabBar.isHidden = true
        //tableview
        setupTableView()
        
    }
    //MARK: - Helpers
    //내비 커스텀
    func configureNavi() {
        navigationController?.hidesBarsOnSwipe = false
        let searchIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "탭바_검색"), style: .plain, target: self, action: #selector(searchSth))
        let homeIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "탭바_작품"), style: .plain, target: self, action: #selector(moveHome))
        let cartIcon = UIBarButtonItem(image: #imageLiteral(resourceName: "상단_장바구니"), style: .plain, target: self, action: #selector(moveCart))
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(moveHome))
        
        navigationItem.rightBarButtonItems = [ cartIcon, homeIcon, searchIcon]
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)

    }
    
    // 내비게이션 바 버튼
    @objc func searchSth() {
        
    }

    @objc func moveHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func moveCart() {
        
    }
    
    // 탭바 버튼
    @IBAction func btnBuy(_ sender: Any) {
    }
    
}

// 테이블뷰 extension
extension DetailViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailImageTableViewCell") as? DetailImageTableViewCell {
                //cell.bannerCellDelegate = self
                //cell.setCell(row: dataArray)
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailSummaryTableViewCell") as? DetailSummaryTableViewCell {
                //cell.eventCellDelegate = self
                //cell.setCell(row: eventArray)
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailShippingTableViewCell") as? DetailShippingTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailInfoTableViewCell") as? DetailInfoTableViewCell {
                //cell.todayGoodsCellDelegate = self
                //cell.setCell(row: todayGoodsArray)
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
            return 414
        case 1:
            return 394
        case 2:
            return 229
        case 3:
            return 330
        default:
            return 100
        }
    }
    
    //tableview cell에 들어갈 cell들의 Nib을 등록
    private func setupTableView(){
            // Register the xib for tableview cell
            tableView.delegate = self
            tableView.dataSource = self
        
            let detailImageCellNib = UINib(nibName: "DetailImageTableViewCell", bundle: nil)
            self.tableView.register(detailImageCellNib, forCellReuseIdentifier: "DetailImageTableViewCell")
        
            let detailSummaryCellNib = UINib(nibName: "DetailSummaryTableViewCell", bundle: nil)
            self.tableView.register(detailSummaryCellNib, forCellReuseIdentifier: "DetailSummaryTableViewCell")
        
            let detailShippingCellNib = UINib(nibName: "DetailShippingTableViewCell", bundle: nil)
            self.tableView.register(detailShippingCellNib, forCellReuseIdentifier: "DetailShippingTableViewCell")
           
            let detailInfoCellNib = UINib(nibName: "DetailInfoTableViewCell", bundle: nil)
            self.tableView.register(detailInfoCellNib, forCellReuseIdentifier: "DetailInfoTableViewCell")
            
    }
}
