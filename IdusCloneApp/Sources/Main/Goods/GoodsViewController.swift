//
//  GoodsViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/01.
//
import UIKit
import Foundation
import XLPagerTabStrip

class GoodsViewController: ButtonBarPagerTabStripViewController, UISearchControllerDelegate{
    
    //MARK: - Outlet
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        configureButtonBar()
        super.viewDidLoad()
        setCustomNavigationBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        setCustomNavigationBar()
    }
    override func viewDidAppear(_ animated: Bool) {
        setCustomNavigationBar()
    }
    //MARK: - Helpers
    
    // 내비게이션 바 디자인
    func setCustomNavigationBar() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        //#imageLiteral(resourceName: "아이디어스로고2")
        let image = #imageLiteral(resourceName: "아이디어스로고2")
        imageView.image = image
        navigationItem.titleView = imageView
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "무료배송을 검색해보세요."
        searchController.searchBar.backgroundColor = UIColor.white
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor.white

        
        self.navigationItem.searchController = searchController
        //self.navigationItem.title = "아이디어스"
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.automaticallyShowsCancelButton = false
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
            
        let child_1 = UIStoryboard(name: "TodayStoryboard", bundle: nil).instantiateViewController(withIdentifier: "TodayViewController")
        let child_2 = UIStoryboard(name: "RealtimeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "RealtimeViewController")
        let child_3 = UIStoryboard(name: "NewStoryboard", bundle: nil).instantiateViewController(withIdentifier: "NewViewController")
        
        return [child_1, child_2, child_3]

    }
    
    var lastContentOffset: CGFloat = 0.0
    
    
    
}


