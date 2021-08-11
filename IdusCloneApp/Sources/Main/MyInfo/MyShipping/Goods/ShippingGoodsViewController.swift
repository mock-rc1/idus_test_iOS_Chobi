//
//  ShippingGoodsViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/12.
//
import UIKit
import XLPagerTabStrip
import Foundation
import SDWebImage

class ShippingGoodsViewController: BaseViewController, IndicatorInfoProvider{
    
    
    @IBOutlet weak var tableView: UITableView!
    // Datamanager
    lazy var dataManager: MyShippingDataManager = MyShippingDataManager()
    var shippingData: [MyShippingResult]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        dataManager.getMyShipping(vc: self, userIdx: 3)
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "작품")
    }
    
    
}

// 테이블뷰 extension
extension ShippingGoodsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        if let x = shippingData{
            return x.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ShippingGoodsTableViewCell") as? ShippingGoodsTableViewCell {
            if let x = shippingData{
                cell.imageProd.sd_setImage(with: URL(string: x[indexPath.row].prodImage!), completed: nil)
                cell.labelDate.text = x[indexPath.row].date!
                cell.labelPrice.text = "\(x[indexPath.row].totalPrice!)".insertComma + "원 >"
                cell.btnState.setTitle(x[indexPath.row].statement!, for: .normal)
                cell.labelTitle.text = x[indexPath.row].prodName!
                cell.labelInfo.text = x[indexPath.row].authorName!
            }
                return cell
        }
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행은 \(indexPath.row) 입니다.")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 161
    }
    
    //tableview cell에 들어갈 cell들의 Nib을 등록
    private func setupTableView(){
            // Register the xib for tableview cell
            tableView.delegate = self
            tableView.dataSource = self
            
        //장바구니
          
        
        let myInfoProfileCellNib = UINib(nibName: "ShippingGoodsTableViewCell", bundle: nil)
        self.tableView.register(myInfoProfileCellNib, forCellReuseIdentifier: "ShippingGoodsTableViewCell")
        
        
        
    }
}


extension ShippingGoodsViewController {
    func didSuccessMyShipping(_ result: MyShippingResponse) {
        //self.presentAlert(title: "장바구니 담기 성공!", message: result.message)
        print("결제 정보 가져오기 성공!\(result.message!)")
        print(result.result)
        shippingData = result.result
        tableView.reloadData()
        
    }
    
    func failedToMyShipping(message: String) {
        self.presentAlert(title: message)
    }
}
