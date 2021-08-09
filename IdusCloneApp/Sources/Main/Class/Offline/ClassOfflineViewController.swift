//
//  ClassOfflineViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/09.
//

import Foundation
import UIKit
import XLPagerTabStrip
class ClassOfflineViewController: UIViewController,IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "오프라인")
      }
}
