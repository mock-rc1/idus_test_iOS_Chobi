//
//  CartViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//
import SDWebImage
import Foundation
import UIKit
/*
protocol OrderRequest: AnyObject {
    func btnOrderRequest() -> String
}*/

class CartViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    //var delegate: OrderRequest?
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelShippingPrice: UILabel!
    
    // Datamanager
    lazy var dataManager: CartDataManager = CartDataManager()
    // Datamanager
    lazy var dataManager2: BasketCartDataManager = BasketCartDataManager()
    
    // Datamanager
    lazy var dataManager3: MakeOrderDataManager = MakeOrderDataManager()
    
    //제품 원래 가격
    var price = 0
    var orderProdIdx = 0
    var cartData: CartResult?
    var basketCartData: BasketCartResult?
    var addressRequest = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupTableView()
        if(Constant.isBasket){
            print("장바구니번호 울랄라\(Constant.basketIdx)")
            //price = Constant.price
            //print("Constant.price \(Constant.price)")
            dataManager2.getBasketCart(vc: self, userIdx: 3)
        }else{
            print("주문번호 울랄라\(Constant.orderIdx)")
            price = Constant.price
            print("Constant.price \(Constant.price)")
            dataManager.getCart(vc: self, userIdx: 3, orderIdx: Constant.orderIdx)
        }
        
        
    }
    func configureUI() {
        
        let btnBack = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(moveBack))
        let cartTitle = UIBarButtonItem(title: "장바구니", style: .plain, target: self, action: #selector(moveBack))
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        navigationItem.leftBarButtonItems = [btnBack, cartTitle]
    }
    
    @objc func moveBack(){
        dismiss(animated: true, completion: nil)
    }
    
    func goBuyPage() {
        let detailStoryboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
        let buyViewController = detailStoryboard.instantiateViewController(identifier: "BuyViewController")
        
        self.navigationController?.pushViewController(buyViewController, animated: true)
    }
    
    @IBAction func btnBuy(_ sender: Any) {
        /*
        let addressRequest = delegate?.btnOrderRequest()
        if let x = addressRequest{
            print(x)
        }*/
        tableView.reloadData()
        
        let basketIdx = [Constant.basketIdx]
        let order = [orderProdIdx]
        
        if(Constant.isBasket){
            let input = MakeOrderRequest(basketIdx: basketIdx, orderProdIdx: order)
            dataManager3.postMakeOrder(input, delegate: self, userIdx: 3)
        }else{
            print("주문 요청: \(addressRequest)")
            
            goBuyPage()
            
        }
        
    }
}



// 테이블뷰 extension
extension CartViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as? CartTableViewCell {
                //cell.bannerCellDelegate = self
                if(Constant.isBasket){
                    if let x = basketCartData{
                        var optionList = ""
                        var optionPrice = 0
                        var prodIdx = 0
                        for option in x.getBasketPriceRes{
                            if(option.basketIdx! == Constant.basketIdx){
                                optionList += "- \(option.prodSideCate!) : \(option.prodSide!) \n"
                                optionPrice = option.optionPrice!
                                prodIdx = option.prodIdx!
                                orderProdIdx = option.orderProdIdx!
                            }
                        }
                        cell.labelOption.text = optionList
                        
                        labelPrice.text = "\(optionPrice)".insertComma + "원"
                        cell.labelPrice.text = "\(optionPrice)".insertComma + "원"
                        cell.labelTotalPrice.text = "\(optionPrice)".insertComma + "원"
                        
                        for info in x.getBasketInfoRes{
                            if(prodIdx == info.prodIdx!){
                                cell.labelAuthor.text = info.authorName!
                                cell.imageProd.sd_setImage(with: URL(string: info.prodImage!), completed: nil)
                                cell.labelTitle.text = info.prodName!
                                cell.labelShipping.text = "\(info.deliveryCost!)".insertComma + "원"
                                cell.labelMake.text = info.prodNum!
                                labelShippingPrice.text = "\(info.deliveryCost!)".insertComma + "원"
                            }
                        }
                    }
                    if let y = cell.textRequest.text{
                        addressRequest = y
                    }
                }else{
                    if let x = cartData{
                        cell.labelAuthor.text = x.getNowBasketinfoRes.authorName!
                        cell.imageProd.sd_setImage(with: URL(string: x.getNowBasketinfoRes.prodImage!), completed: nil)
                        cell.labelTitle.text = x.getNowBasketinfoRes.prodName!
                        cell.labelShipping.text = "\(x.getNowBasketinfoRes.deliveryCost!)".insertComma + "원"
                        cell.labelMake.text = x.getNowBasketinfoRes.prodNum!
                        labelShippingPrice.text = "\(x.getNowBasketinfoRes.deliveryCost!)".insertComma + "원"
                        var optionList = ""
                        var optionPrice = 0
                        for option in x.getNowBasketOptionRes{
                            optionList += "- \(option.prodSideCate!) : \(option.prodSide!) \n"
                            optionPrice = option.optionPrice!
                        }
                        cell.labelOption.text = optionList
                        
                        labelPrice.text = "\(optionPrice)".insertComma + "원"
                        cell.labelPrice.text = "\(optionPrice)".insertComma + "원"
                        cell.labelTotalPrice.text = "\(optionPrice)".insertComma + "원"
                    }
                    if let y = cell.textRequest.text{
                        addressRequest = y
                    }
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
            return 572
        default:
            return 100
        }
    }
    
    //tableview cell에 들어갈 cell들의 Nib을 등록
    private func setupTableView(){
            // Register the xib for tableview cell
            tableView.delegate = self
            tableView.dataSource = self
            
        //장바구니
            let curatingCellNib = UINib(nibName: "CartTableViewCell", bundle: nil)
            self.tableView.register(curatingCellNib, forCellReuseIdentifier: "CartTableViewCell")
        
        
    }
}
extension CartViewController {
    func didSuccessCart(_ result: CartResponse) {
        //self.presentAlert(title: "장바구니 담기 성공!", message: result.message)
        print("장바구니 가져오기 성공!\(result.message!)")
        print(result.result)
        cartData = result.result
        tableView.reloadData()
        
        //labelPrice.text = "\(Constant.price)".insertComma + "원"
        //labelShippingPrice.text = "\(String(describing: cartData?.getNowBasketinfoRes.deliveryCost!))".insertComma + "원"
    }
    
    func failedToCart(message: String) {
        self.presentAlert(title: message)
    }
}
extension CartViewController {
    func didSuccessBasketCart(_ result: BasketCartResponse) {
        //self.presentAlert(title: "장바구니 담기 성공!", message: result.message)
        print("장바구니 가져오기 성공!\(result.message!)")
        print(result.result)
        basketCartData = result.result
        tableView.reloadData()
        
        //labelPrice.text = "\(Constant.price)".insertComma + "원"
        //labelShippingPrice.text = "\(String(describing: cartData?.getNowBasketinfoRes.deliveryCost!))".insertComma + "원"
    }
    
    func failedToBasketCart(message: String) {
        self.presentAlert(title: message)
    }
}
extension CartViewController {
    func didSuccessMakeOrder(_ result: MakeOrderResponse) {
        //self.presentAlert(title: "장바구니 담기 성공!", message: result.message)
        print("장바구니 주문 생성 성공!\(result.message!)")
        print(result.result)
        Constant.orderIdx = result.result.orderIdx!
        goBuyPage()
        
    }
    
    func failedToMakeOrder(message: String) {
        self.presentAlert(title: message)
    }
}
