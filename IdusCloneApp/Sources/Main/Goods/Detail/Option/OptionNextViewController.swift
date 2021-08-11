//
//  OptionNextViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//

import UIKit

class OptionNextViewController: UIViewController {
    
    //가격, 배송비 정보 받기
    var price: Int?
    var shipping: Int?
    var detailData: DetailResult?
    var finalSection: [String]?
    
    //Post 항목들
    var userIdx: Int?
    var prodIdx: Int?
    var prodSideIdx: [Int]?
    var prodPrice: [Int]?
    
    //옵션 1 개수
    var option1: Int?
    
    // 주문 번호
    var orderIdx: Int?
    
    //장바구니 번호
    var basketIdx: Int?
 
    
    // Datamanager
    lazy var dataManager: OptionNextDataManager = OptionNextDataManager()
    lazy var dataManager2: BasketDataManager = BasketDataManager()
    
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var labelShipping: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
        labelShipping.text = "\(shipping!)".insertComma + "원"
        labelTotal.text = "\(price!)".insertComma + "원"
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: false)
            
      
    }
    //즉시구매 장바구니 페이지로
    @IBAction func btnBuy(_ sender: Any) {
        // post 작품담기
        
        var authorIdx = 1
        if(detailData!.getDetailRes.authorName! == "씨리얼즈"){
            authorIdx = 2
        }else if(detailData!.getDetailRes.authorName! == "레스터"){
            authorIdx = 3
            prodSideIdx![0] += 20
            prodSideIdx![1] += 20 + option1!
        }else if(detailData!.getDetailRes.authorName! == "체크포러브"){
            authorIdx = 4
        }else{
            prodSideIdx![0] += 1
            prodSideIdx![1] += 1 + option1!
        }
        
        let input = OptionNextRequest(userIdx: 3, prodIdx: prodIdx!, authorIdx: authorIdx, prodPrice: prodPrice! ,prodCount: [1,1],prodSideIdx: prodSideIdx!)
        print(input)
        //print(email)
        
        dataManager.postOptionNext(input, delegate: self, userIdx: 3)
        showIndicator()
    }
    @IBAction func btnBaskets(_ sender: Any) {
        
        var authorIdx = 1
        if(detailData!.getDetailRes.authorName! == "씨리얼즈"){
            authorIdx = 2
        }else if(detailData!.getDetailRes.authorName! == "레스터"){
            authorIdx = 3
            prodSideIdx![0] += 20
            prodSideIdx![1] += 20 + option1!
        }else if(detailData!.getDetailRes.authorName! == "체크포러브"){
            authorIdx = 4
        }else{
            prodSideIdx![0] += 1
            prodSideIdx![1] += 1 + option1!
        }
        
        let input = BasketRequest(userIdx: 3, prodIdx: prodIdx!, authorIdx: authorIdx, prodPrice: prodPrice! ,prodCount: [1,1],prodSideIdx: prodSideIdx!)
        print(input)
        //print(email)
        dataManager2.postBasket(input, delegate: self, userIdx: 3)
        showIndicator()
        
    }
    // 페이지 이동
    func goCartViewController()  {
        Constant.isBasket = false
        let detailStoryboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
        let cartViewController = detailStoryboard.instantiateViewController(identifier: "CartViewController")
        let vc = UINavigationController(rootViewController: cartViewController)
        
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    

}
// 테이블뷰 extension
extension OptionNextViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AllSelectedTableViewCell") as? AllSelectedTableViewCell {
                //cell.bannerCellDelegate = self
                if let x = finalSection{
                    cell.finalSelection.text = "\(x[0])\(x[1])"
                    cell.totalMoney.text = "\(price!)".insertComma + "원"
                }
                return cell
            }
        return UITableViewCell()
        
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("선택된 행은 \(indexPath.row) 입니다.")
        
    }
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        default:
            return tableView.estimatedRowHeight
        }
    }*/
    
    //tableview cell에 들어갈 cell들의 Nib을 등록
    private func setupTableView(){
            // Register the xib for tableview cell
            tableView.delegate = self
            tableView.dataSource = self
            
        //모두 선택 완료
            let allSelectedCellNib = UINib(nibName: "AllSelectedTableViewCell", bundle: nil)
            self.tableView.register(allSelectedCellNib, forCellReuseIdentifier: "AllSelectedTableViewCell")
       
    }
}

extension OptionNextViewController {
    func didSuccessOptionNext(_ result: OptionNextResponse) {
        //self.presentAlert(title: "장바구니 담기 성공!", message: result.message)
        dismissIndicator()
        print("장바구니 담기 성공!\(result.message!)")
        if let x = result.result{
            print("주문 번호\(x.orderIdx!)")
            orderIdx = x.orderIdx
        }
        Constant.orderIdx = orderIdx!
        
        goCartViewController()
        
       
    }
    
    func failedToOptionNext(message: String) {
        self.presentAlert(title: message)
    }
}
extension OptionNextViewController {
    func didSuccessBasket(_ result: BasketResponse) {
        //self.presentAlert(title: "장바구니 담기 성공!", message: result.message)
        dismissIndicator()
        self.presentBottomAlert(message: "장바구니 담기 성공!")
        print("장바구니 담기 성공!\(result.message!)")
        if let x = result.result{
            print("장바구니 번호\(x.basketIdx![0])")
            basketIdx = x.basketIdx![0]
        }
        Constant.basketIdx = basketIdx!
        
        //self.dismiss(animated: true)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)

       
    }
    
    func failedToBasket(message: String) {
        self.presentAlert(title: message)
    }
}
