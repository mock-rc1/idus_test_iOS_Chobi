//
//  ShippingOfflineViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/12.
//

import Foundation

import UIKit
import XLPagerTabStrip

class ShippingOfflineViewController: BaseViewController, IndicatorInfoProvider{
    
    

        override func viewDidLoad() {
        super.viewDidLoad()
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "오프라인 클래스")
    }
    
    
}
