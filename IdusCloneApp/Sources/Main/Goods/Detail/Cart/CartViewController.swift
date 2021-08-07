//
//  CartViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/07.
//

import Foundation
import UIKit

class CartViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    func configureUI() {
        //navigationController?.hidesBarsOnSwipe = false
        /*
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(moveBack))
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        print(UITabBarController().tabBar.frame.height)
        self.tabBarController?.tabBar.isHidden = true*/
        let btnBack = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(moveBack))
        let cartTitle = UIBarButtonItem(image: #imageLiteral(resourceName: "장바구니_내비"), style: .plain, target: self, action: #selector(moveBack))
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9685532451, green: 0.9686692357, blue: 0.968513906, alpha: 1)
        navigationItem.leftBarButtonItems = [btnBack, cartTitle]
    }
    
    @objc func moveBack(){
        dismiss(animated: true, completion: nil)
    }
}
