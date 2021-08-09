//
//  ClassOnlineViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/09.
//

import Foundation
import UIKit
import XLPagerTabStrip
class ClassOnlineViewController: UIViewController,IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "온라인")
      }
}
