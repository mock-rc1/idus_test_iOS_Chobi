//
//  SearchViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/09.
//
import UIKit
import Foundation
class SearchViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchStoryboard = UIStoryboard(name: "SearchStoryboard", bundle: nil)
        let searchNextViewController = searchStoryboard.instantiateViewController(identifier: "SearchNextVC")
        searchNextViewController.modalPresentationStyle = .overFullScreen
        self.present(searchNextViewController, animated: true, completion: nil)
    }



}
