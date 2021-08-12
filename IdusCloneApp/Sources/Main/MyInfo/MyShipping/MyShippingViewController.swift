//
//  MyShippingViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/12.
//
import XLPagerTabStrip
import Foundation
class MyShippingViewController: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        configureButtonBar()
        super.viewDidLoad()
        configureUI()
        self.tabBarController?.tabBar.isHidden = true
    }
    func configureUI() {
        
        let btnBack = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(moveBack))
        let buyTitle = UIBarButtonItem(title: "주문 배송", style: .plain, target: self, action: #selector(moveBack))
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1960550249, green: 0.1960947514, blue: 0.1960498393, alpha: 1)
        navigationItem.leftBarButtonItems = [btnBack, buyTitle]
    }
    @objc func moveBack(){
        self.navigationController?.popViewController(animated: true)
    }
    // 탭바 디자인
    func configureButtonBar() {
            settings.style.buttonBarBackgroundColor = .white
            settings.style.buttonBarItemBackgroundColor = .white

            settings.style.buttonBarItemFont = UIFont(name: "Helvetica", size: 17.0)!
            settings.style.buttonBarItemTitleColor = .gray
            
            settings.style.buttonBarMinimumLineSpacing = 20
            settings.style.buttonBarItemsShouldFillAvailableWidth = true
            settings.style.buttonBarLeftContentInset = 0
            settings.style.buttonBarRightContentInset = 0

            settings.style.selectedBarHeight = 3.0
            settings.style.selectedBarBackgroundColor = .orange
            
            // Changing item text color on swipe
            changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
                guard changeCurrentIndex == true else { return }
                oldCell?.label.textColor = .gray
                newCell?.label.textColor = .orange
        }
        
    }
    // MARK: - PagerTabStripDataSource
        override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
            
            let child1 = UIStoryboard(name: "MyInfoStoryboard", bundle: nil).instantiateViewController(identifier: "ShippingGoodsViewController")
            let child2 = UIStoryboard(name: "MyInfoStoryboard", bundle: nil).instantiateViewController(identifier: "ShippingOnlineClassViewController")
            let child3 = UIStoryboard(name: "MyInfoStoryboard", bundle: nil).instantiateViewController(identifier: "ShippingOfflineViewController")
            return [child1, child2, child3]
        }
    
   
}
