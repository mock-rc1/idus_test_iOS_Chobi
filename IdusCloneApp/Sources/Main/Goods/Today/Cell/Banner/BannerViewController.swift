//
//  BannerViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/12.
//
import UIKit
import Foundation
class BannerViewController: BaseViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomNavigationBar()
    }
    // 내비게이션 바 디자인
    func setCustomNavigationBar() {
        
        navigationItem.title = "작품 찜하고 반값줍줍"
        
        let btnBack = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(moveBack))
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        navigationItem.leftBarButtonItems = [btnBack]
        
    }
    @objc func moveBack(){
        self.navigationController?.popToRootViewController(animated: true)
    }
}
