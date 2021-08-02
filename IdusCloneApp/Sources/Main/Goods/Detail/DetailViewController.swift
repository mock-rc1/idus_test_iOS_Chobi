//
//  DetailViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/08/02.
//
import UIKit
class DetailViewController: BaseViewController{
    //MARK: - Outlet
    @IBOutlet weak var labelTitle: UILabel!

    var data: String?
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = data
    }
    //MARK: - Helpers
}
