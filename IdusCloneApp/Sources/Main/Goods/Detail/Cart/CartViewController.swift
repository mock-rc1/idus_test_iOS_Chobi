//
//  CartViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//

import Foundation
import UIKit

class CartViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupTableView()
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
