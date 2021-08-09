//
//  CategoryViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/09.
//
import UIKit
import Foundation
import XLPagerTabStrip
class CategoryViewController: ButtonBarPagerTabStripViewController {
    override func viewDidLoad() {
        configureButtonBar()
        super.viewDidLoad()
        setCustomNavigationBar()
        //navi()
    }
    // 내비게이션 바 디자인
    func setCustomNavigationBar() {
        let btnCart = UIBarButtonItem(image: #imageLiteral(resourceName: "상단_장바구니"), style: .plain, target: self, action: #selector(btnCart))
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1960550249, green: 0.1960947514, blue: 0.1960498393, alpha: 1)
        navigationItem.rightBarButtonItem = btnCart
        let btnInfo = UIBarButtonItem(title: "카테고리", style: .plain, target: self, action: #selector(btnCartegory))
        navigationItem.leftBarButtonItem = btnInfo

    }
    @objc func btnCart() {
        
    }
    @objc func btnCartegory() {
        
    }
    func navi(){
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "보양식을 검색해주세요."
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "아이디어스"
        //self.navigationController?.navigationBar.prefersLargeTitles = true // Large title로 하고싶을 때 추가

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
            
            let child1 = UIStoryboard(name: "CategoryStoryboard", bundle: nil).instantiateViewController(identifier: "CategoryGoodsViewController")
            let child2 = UIStoryboard(name: "CategoryStoryboard", bundle: nil).instantiateViewController(identifier: "CategoryClassViewController")
            return [child1, child2]
        }
    
   


}

