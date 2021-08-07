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
        dismiss(animated: false, completion: nil)
    }
    //장바구니 페이지로
    @IBAction func btnBuy(_ sender: Any) {
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

