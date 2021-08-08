//
//  BuyViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/08.
//

import Foundation
import UIKit

class BuyViewController: BaseViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupTableView()
    }
    func configureUI() {
        
        let btnBack = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(moveBack))
        let buyTitle = UIBarButtonItem(title: "주문 결제", style: .plain, target: self, action: #selector(moveBack))
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1960550249, green: 0.1960947514, blue: 0.1960498393, alpha: 1)
        navigationItem.leftBarButtonItems = [btnBack, buyTitle]
    }
    @objc func moveBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnBuy(_ sender: Any) {
        print("결제")
    }
    
}
// 테이블뷰 extension
extension BuyViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyUserTableViewCell") as? BuyUserTableViewCell {
                //cell.bannerCellDelegate = self
                /*
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                }*/
                return cell
            }
        case 1,3,5,7,9,11:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "LineTableViewCell") as? LineTableViewCell {
                //cell.bannerCellDelegate = self
                /*
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                }*/
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyAddressTableViewCell") as? BuyAddressTableViewCell {
                //cell.bannerCellDelegate = self
                /*
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                }*/
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyInfoTableViewCell") as? BuyInfoTableViewCell {
                //cell.bannerCellDelegate = self
                /*
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                }*/
                return cell
            }
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyPaymentTableViewCell") as? BuyPaymentTableViewCell {
                //cell.bannerCellDelegate = self
                /*
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                }*/
                return cell
            }
        case 8:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyPaymentInfoTableViewCell") as? BuyPaymentInfoTableViewCell {
                //cell.bannerCellDelegate = self
                /*
                if let x = newData?.getNewRes{
                    cell.setCell(new: x)
                }*/
                return cell
            }
        case 10:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyAgreeTableViewCell") as? BuyAgreeTableViewCell {
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
            return 65
        case 1,3,5,7,9,11:
            return 15
        case 2:
            return 365
        case 4:
            return 74
        case 6:
            return 495
        case 8:
            return 275
        case 10:
            return 61
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
            let curatingCellNib = UINib(nibName: "BuyUserTableViewCell", bundle: nil)
            self.tableView.register(curatingCellNib, forCellReuseIdentifier: "BuyUserTableViewCell")
        let lineCellNib = UINib(nibName: "LineTableViewCell", bundle: nil)
        self.tableView.register(lineCellNib, forCellReuseIdentifier: "LineTableViewCell")
        
        let addressCellNib = UINib(nibName: "BuyAddressTableViewCell", bundle: nil)
        self.tableView.register(addressCellNib, forCellReuseIdentifier: "BuyAddressTableViewCell")
        
        let infoCellNib = UINib(nibName: "BuyInfoTableViewCell", bundle: nil)
        self.tableView.register(infoCellNib, forCellReuseIdentifier: "BuyInfoTableViewCell")
        
        let paymentCellNib = UINib(nibName: "BuyPaymentTableViewCell", bundle: nil)
        self.tableView.register(paymentCellNib, forCellReuseIdentifier: "BuyPaymentTableViewCell")
        
        let paymentInfoCellNib = UINib(nibName: "BuyPaymentInfoTableViewCell", bundle: nil)
        self.tableView.register(paymentInfoCellNib, forCellReuseIdentifier: "BuyPaymentInfoTableViewCell")
        
        let agreeCellNib = UINib(nibName: "BuyAgreeTableViewCell", bundle: nil)
        self.tableView.register(agreeCellNib, forCellReuseIdentifier: "BuyAgreeTableViewCell")
        
    }
}
