//
//  TransitionViewController.swift
//  EduTemplate - storyboard
//
//  Created by Zero Yoon on 2022/02/23.
//

import UIKit

class TransitionViewController: BaseViewController {
    // MARK: RootViewController로 이동
    @IBAction func changeRootViewControllerButtonTouchUpInside(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: 새로운 window로 화면전환
    @IBAction func changeWindowButtonTouchUpInside(_ sender: UIButton) {
        let splashStoryboard = UIStoryboard(name: "SplashStoryboard", bundle: nil)
        let splashViewController = splashStoryboard.instantiateViewController(identifier: "SplashViewController")
        self.changeRootViewController(splashViewController)
    }
}
