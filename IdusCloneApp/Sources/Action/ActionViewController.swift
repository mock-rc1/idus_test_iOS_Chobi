//
//  ActionViewController.swift
//  EduTemplate - storyboard
//
//  Created by Zero Yoon on 2022/02/23.
//

import UIKit

class ActionViewController: BaseViewController {
    // MARK: 인디케이터 (로딩)
    @IBAction func indicatorButtonTapped(_ sender: UIButton) {
        showIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismissIndicator()
        }
    }
    
    // MARK: 인디케이터 (커스텀 gif)
    @IBAction func gifIndicatorButtonTapped(_ sender: UIButton) {
        let containerView = UIView(frame: UIScreen.main.bounds)
        let activityIndicator = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 191.8, height: 85.2)))
        let images: [UIImage] = Array(0..<12).map{ UIImage(named: "bts\($0)")! }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        containerView.frame = window.frame
        containerView.center = window.center
        containerView.backgroundColor = .clear
        containerView.addSubview(activityIndicator)
        UIApplication.shared.windows.first?.addSubview(containerView)
        
        containerView.backgroundColor = UIColor(hex: 0x000000, alpha: 0.4)
        activityIndicator.center = containerView.center
        activityIndicator.animationImages = images
        activityIndicator.animationDuration = Double(activityIndicator.animationImages?.count ?? 0) / 12
        activityIndicator.animationRepeatCount = 0
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            activityIndicator.stopAnimating()
            containerView.removeFromSuperview()
        }
    }
}
