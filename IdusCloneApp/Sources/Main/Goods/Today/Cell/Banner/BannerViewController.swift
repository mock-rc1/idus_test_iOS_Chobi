//
//  BannerViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/12.
//
import UIKit
import Foundation
class BannerViewController: BaseViewController{
    
    var index: Int?
    
    @IBOutlet weak var imageView: UIImageView!
    //   #imageLiteral(resourceName: "취미클래스2")
    var imageArray =  [#imageLiteral(resourceName: " 굿바이 써머") , #imageLiteral(resourceName: "향덕들이이여름향기를좋아합니다") , #imageLiteral(resourceName: "배너상세") ,#imageLiteral(resourceName: "배너상세") , #imageLiteral(resourceName: "배너상세"), #imageLiteral(resourceName: "향덕들이이여름향기를좋아합니다") , #imageLiteral(resourceName: "취미클래스2")]
    var textArray = ["굿바이 써머","향덕들이이여름향기를좋아합니다", "작품 찜하고 반값줍줍", "작품 찜하고 반값줍줍", "작품 찜하고 반값줍줍" ,"향덕들이이여름향기를좋아합니다", "취미클래스"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomNavigationBar()
        imageView.image = imageArray[index!]
        self.tabBarController?.tabBar.isHidden = true
    }
    // 내비게이션 바 디자인
    func setCustomNavigationBar() {
        
        navigationItem.title = textArray[index!]
        
        let btnBack = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(moveBack))
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        navigationItem.leftBarButtonItems = [btnBack]
        
    }
    @objc func moveBack(){
        self.navigationController?.popToRootViewController(animated: true)
    }
}
