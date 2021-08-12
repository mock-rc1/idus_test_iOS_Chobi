//
//  EventViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/12.
//
import UIKit
import Foundation
class EventViewController: BaseViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    var index:Int?
    //#imageLiteral(resourceName: "남성잇템2")
    var imageArray =  [#imageLiteral(resourceName: "배너상세"), #imageLiteral(resourceName: "이벤트상세") , #imageLiteral(resourceName: "배너상세") ,#imageLiteral(resourceName: "취미클래스2") ,#imageLiteral(resourceName: "지금 할인중"),  #imageLiteral(resourceName: "배너상세") ,  #imageLiteral(resourceName: "배너상세"), #imageLiteral(resourceName: "소신있는 가치소비, 비건 라이프") ,#imageLiteral(resourceName: "남성잇템2"),  #imageLiteral(resourceName: "배너상세") ]
    var textArray = ["작품 찜하고 반값줍줍","BEST 선물", "작품 찜하고 반값줍줍", "취미클래스", "지금 할인중" ,"작품 찜하고 반값줍줍", "작품 찜하고 반값줍줍","소신있는 가치소비, 비건 라이프", "남성잇템", "작품 찜하고 반값줍줍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomNavigationBar()
        self.tabBarController?.tabBar.isHidden = true
        imageView.image = imageArray[index!]
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
