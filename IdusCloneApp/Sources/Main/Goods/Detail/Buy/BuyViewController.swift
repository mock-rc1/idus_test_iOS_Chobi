//
//  BuyViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/08.
//

import Foundation
import UIKit

class BuyViewController: BaseViewController, PaymentProtocol{
    func didSelectBtnPayment(type: Int) {
        paymentType = type
        print(type)
        tableView.reloadData()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var labelPayment: UILabel!
    // Datamanager
    lazy var dataManager: BuyDataManager = BuyDataManager()
    
    // Datamanager
    lazy var dataManager2: PaymentDataManager = PaymentDataManager()
    
    var buyData: BuyResult?
    var paymentType = 1
    var totalPrice = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupTableView()
        
        dataManager.getBuy(vc: self, userIdx: 3, orderIdx: Constant.orderIdx)
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
        let input = PaymentRequest(orderIdx: Constant.orderIdx, totalPrice: totalPrice, deliveryIdx: 1, paymentType: paymentType)
        print(input)
        //print(email)
        dataManager2.patchPayment(input, delegate: self, userIdx: 3)
    }
    func goMainPage()  {
        let mainTabBarController = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(identifier: "MainTabBarController")
        changeRootViewController(mainTabBarController)
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
                
                if let x = buyData?.getPaymentInfoRes{
                    cell.labelUser.text = "\(x.userName!)(" + "\(x.phoneNum!)".pretty() + ")"
                }
                return cell
            }
        case 1,3,5,7,9,11:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "LineTableViewCell") as? LineTableViewCell {
                //cell.bannerCellDelegate = self
                
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyAddressTableViewCell") as? BuyAddressTableViewCell {
                //cell.bannerCellDelegate = self
                if let x = buyData?.getPaymentDeliveryRes{
                    cell.labelName.text = x[0].deliveryName!
                    cell.labelPhone.text = x[0].deliveryPhoneNum!.pretty()
                    cell.labelAddress.text = x[0].address!
                    
                }
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyInfoTableViewCell") as? BuyInfoTableViewCell {
                //cell.bannerCellDelegate = self
                
                if let x = buyData?.getPaymentProdRes{
                    cell.labelInfo.text = x[0].prodName!
                    
                }
                return cell
            }
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyPaymentTableViewCell") as? BuyPaymentTableViewCell {
                cell.delegate = self
                //cell.bannerCellDelegate = self
                /*
                if cell.btn1.isSelected{
                    paymentType = 1
                }else if cell.btn2.isSelected{
                    paymentType = 2
                }else if cell.btn3.isSelected{
                    paymentType = 3
                }else if cell.btn4.isSelected{
                    paymentType = 4
                }else if cell.btn5.isSelected{
                    paymentType = 5
                }else if cell.btn6.isSelected{
                    paymentType = 6
                }else if cell.btn7.isSelected{
                    paymentType = 7
                }*/
                return cell
            }
        case 8:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyPaymentInfoTableViewCell") as? BuyPaymentInfoTableViewCell {
                //cell.bannerCellDelegate = self
                var data = 0
                if let x = buyData?.getPaymentInfoRes{
                    cell.labelPrice.text = "\(x.totalProdPrice!)".insertComma + "원"
                    data += x.totalProdPrice!
                }
                if let y = buyData?.getPaymentProdRes{
                    cell.labelShipping.text = "\(y[0].deliveryCost!)".insertComma + "원"
                    data += y[0].deliveryCost!
                }
                cell.labelTotalPrice.text = "\(data)".insertComma + "원"
                
                if(paymentType == 1){
                    labelPayment.text = "\(data)".insertComma + "원 간편하게 카드 결제"
                }else if(paymentType == 2){
                    labelPayment.text = "\(data)".insertComma + "원 복잡하게 카드 결제"
                }else if(paymentType == 3){
                    labelPayment.text = "\(data)".insertComma + "원 차이"
                }else if(paymentType == 4){
                    labelPayment.text = "\(data)".insertComma + "원 네이버페이"
                }else if(paymentType == 5){
                    labelPayment.text = "\(data)".insertComma + "원 계좌이체/무통장입금"
                }else if(paymentType == 6){
                    labelPayment.text = "\(data)".insertComma + "원 휴대폰 결제"
                }else if(paymentType == 7){
                    labelPayment.text = "\(data)".insertComma + "원 토스"
                }
                totalPrice = data
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
extension BuyViewController {
    func didSuccessBuy(_ result: BuyResponse) {
        //self.presentAlert(title: "장바구니 담기 성공!", message: result.message)
        print("결제 정보 가져오기 성공!\(result.message!)")
        print(result.result)
        buyData = result.result
        tableView.reloadData()
        
        //labelPrice.text = "\(Constant.price)".insertComma + "원"
        //labelShippingPrice.text = "\(String(describing: cartData?.getNowBasketinfoRes.deliveryCost!))".insertComma + "원"
    }
    
    func failedToBuy(message: String) {
        self.presentAlert(title: message)
    }
}
extension BuyViewController {
    func didSuccessPayment(_ result: PaymentResponse) {
        //self.presentAlert(title: "장바구니 담기 성공!", message: result.message)
        //dismissIndicator()
        print("결제 성공! \(result.message!)")
        self.goMainPage()
    }
    
    func failedToPayment(message: String) {
        self.presentAlert(title: message)
    }
}


extension String { func pretty() -> String {
    let _str = self.replacingOccurrences(of: "-", with: "")
    // 하이픈 모두 빼준다
    let arr = Array(_str)
    if arr.count > 3 {
        let prefix = String(format: "%@%@", String(arr[0]), String(arr[1]))
        if prefix == "02" { // 서울지역은 02번호
            if let regex = try? NSRegularExpression(pattern: "([0-9]{2})([0-9]{3,4})([0-9]{4})", options: .caseInsensitive)
            {
                let modString = regex.stringByReplacingMatches(in: _str, options: [], range: NSRange(_str.startIndex..., in: _str), withTemplate: "$1-$2-$3")
                return modString
                
            }
            
        }
        else if prefix == "15" || prefix == "16" || prefix == "18"
        { // 썩을 지능망...
            if let regex = try? NSRegularExpression(pattern: "([0-9]{4})([0-9]{4})", options: .caseInsensitive) {
                let modString = regex.stringByReplacingMatches(in: _str, options: [], range: NSRange(_str.startIndex..., in: _str), withTemplate: "$1-$2")
                return modString
                
            }
            
        } else { // 나머지는 휴대폰번호 (010-xxxx-xxxx, 031-xxx-xxxx, 061-xxxx-xxxx 식이라 상관무)
            if let regex = try? NSRegularExpression(pattern: "([0-9]{3})([0-9]{3,4})([0-9]{4})", options: .caseInsensitive)
            {
                let modString = regex.stringByReplacingMatches(in: _str, options: [], range: NSRange(_str.startIndex..., in: _str), withTemplate: "$1-$2-$3")
                return modString
                
            }
            
        }
        
    }
    return self
    
}

}


