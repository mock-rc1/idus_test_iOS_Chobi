//
//  OptionViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/06.
//

import UIKit

class OptionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelShipping: UILabel!
    @IBOutlet weak var labelTotalMoney: UILabel!
    
    var optionData: [OptionResult]?
    
    lazy var dataManager: OptionDataManager = OptionDataManager()
    
    //가격, 배송비 정보 받기
    var price: Int?
    var shipping: Int?
    var detailData: DetailResult?
    
    //상품 인덱스
    var prodIdx: Int?
    
    //총 옵션 개수
    var optionCount = 0
    // 옵션별 항목 개수
    var optionSide = [0,0]
    
    // 테이블 뷰
    var option1: [String] = []
    var option2: [String] = []
    
    var option1Money: [Int] = []
    var option2Money: [Int] = []
    
    var optionSection: [String] = ["",""]
    
    
    var finalSection: [String] = []
    
    var prodSideIdx: [Int] = [0,0]
    var prodPrice: [Int] = [0]
    //테이블 뷰 접기
    var folder = [false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Constant.price = self.price!
        print("Constant.price\(Constant.price)")
        setupTableView()
        // Do any additional setup after loading the view.
        labelShipping.text = "\(shipping!)".insertComma + "원"
        labelTotalMoney.text = "\(price!)".insertComma + "원"
        
        dataManager.getOption(vc: self, userIdx: 3, prodIdx: prodIdx!)
    }

    @IBAction func btnCart(_ sender: Any) {
    }
    @IBAction func btnBuy(_ sender: Any) {
    }
    func nextPage() {
        let nextVC = OptionNextViewController()
        nextVC.modalPresentationStyle = .custom
        nextVC.price = price
        nextVC.shipping = shipping
        nextVC.detailData = detailData
        nextVC.finalSection = finalSection
        nextVC.prodSideIdx = prodSideIdx
        nextVC.prodIdx = prodIdx
        nextVC.prodPrice = prodPrice
        //첫번째 옵션 개수
        nextVC.option1 = optionSide[0]
        self.present(nextVC, animated: false, completion: nil)
    }
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

// 테이블뷰 extension
extension OptionViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return optionSection.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return optionSection[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        /*
        if let x = optionData{
            return x.count
        }else{
            return 0
        }*/
        if folder[section] == false{
            if section == 0{
                return option1.count
            }else if section == 1 {
                return option2.count
            }else{
                return 0
            }
        }else {
            return 0
            
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            if let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell") as? OptionTableViewCell {
                //cell.bannerCellDelegate = self
                if indexPath.section == 0{
                    cell.label.text = option1[indexPath.row]
                    return cell
                }else if indexPath.section == 1{
                    cell.label.text = option2[indexPath.row]
                    return cell
                }else{
                    return UITableViewCell()
                }
            }
        return UITableViewCell()
        
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("선택된 행은 \(indexPath.row) 입니다.")
        if indexPath.section == 0{
            print(option1[indexPath.row])
            folder[0] = true
            price! += option1Money[indexPath.row]
            labelTotalMoney.text = "\(price!)".insertComma + "원"
            finalSection.append("1. \(optionSection[0]): \(option1[indexPath.row]) /")
            prodSideIdx[0] = indexPath.row
            prodPrice[0] += option1Money[indexPath.row]
        }else if indexPath.section == 1{
            print(option2[indexPath.row])
            folder[1] = true
            price! += option2Money[indexPath.row]
            labelTotalMoney.text = "\(price!)".insertComma + "원"
            finalSection.append("2. \(optionSection[1]): \(option2[indexPath.row])")
            prodSideIdx[1] = indexPath.row
            prodPrice[0] += option2Money[indexPath.row]
        }
        if(folder[0] == true && folder[1] == true){
            print("다음 화면")
            prodPrice[0] += Constant.price
            print("옵션별 가격 확인 :\(prodPrice)")
            nextPage()
        }
        tableView.reloadData()
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
        //옵션 section
            let optionCellNib = UINib(nibName: "OptionTableViewCell", bundle: nil)
            self.tableView.register(optionCellNib, forCellReuseIdentifier: "OptionTableViewCell")
    }
}

extension OptionViewController {
    func didSuccessOption(result: OptionResponse) {
        optionData = result.result
        
        print("DEBUG: 데이터 로딩 성공")
        let num = optionData!.count
        optionCount = optionData![num - 1].sideCateNum!
        print("옵션 개수\(optionCount)")
        for option in optionData!{
            for i in 0..<optionCount{
                if(option.sideCateNum! == (i+1)){
                    optionSide[i] += 1
                }
            }
        }
        for option in optionData!{
            //옵션 1이면
            if(option.sideCateNum! == 1){
                option1.append(option.prodSide!)
                option1Money.append(option.prodSidePrice!)
                optionSection[0] = option.prodSideCate!
            }
            //옵션 2이면
            else if(option.sideCateNum! == 2){
                option2.append(option.prodSide!)
                option2Money.append(option.prodSidePrice!)
                optionSection[1] = option.prodSideCate!
            }
        }
        
        tableView.reloadData()
        //print(detailData?.getDetailProdImgRes)
    }
    
    func failedToRequest(message: String) {
        print("DEBUG: 데이터 로딩 실패.")
    }
}
