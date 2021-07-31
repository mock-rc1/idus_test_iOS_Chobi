//
//  RegisterViewController.swift
//  IdusCloneApp
//
//  Created by 김수빈 on 2021/07/31.
//

import UIKit
class RegisterViewController: BaseViewController, UITextFieldDelegate{
    
    //MARK: - Outlet
    
    // 체크 버튼 이미지
    
    let imgCheck = UIImage(systemName: "checkmark.square")
    let imgUnCheck = UIImage(systemName: "square")
    
    // 텍스트 필드
    @IBOutlet weak var labelEmail: UITextField!
    @IBOutlet weak var labelName: UITextField!
    @IBOutlet weak var labelPassword: UITextField!
    @IBOutlet weak var labelPasswordCheck: UITextField!
    @IBOutlet weak var labelPhoneNumber: UITextField!
    @IBOutlet weak var labelRecommendCode: UITextField!
    
    // 약관 동의 버튼
    @IBOutlet weak var btnAllAgree: UIButton!
    @IBOutlet weak var btnCheck1: UIButton!
    @IBOutlet weak var btnCheck2: UIButton!
    @IBOutlet weak var btnCheck3: UIButton!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setKeyboardDelegate()
    }
    
    //MARK: - Helpers
    
    //뒤로가기 버튼
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // 약관 모두 동의
    @IBAction func btnAllAgree(_ sender: Any) {
        if btnAllAgree.isSelected{
            btnAllAgree.setImage(imgUnCheck, for: .normal)
            btnCheck1.setImage(imgUnCheck, for: .normal)
            btnCheck2.setImage(imgUnCheck, for: .normal)
            btnCheck3.setImage(imgUnCheck, for: .normal)
        }else{
            btnAllAgree.setImage(imgCheck, for: .normal)
            btnCheck1.setImage(imgCheck, for: .normal)
            btnCheck2.setImage(imgCheck, for: .normal)
            btnCheck3.setImage(imgCheck, for: .normal)
        }
        btnAllAgree.isSelected.toggle()
        btnCheck1.isSelected.toggle()
        btnCheck2.isSelected.toggle()
        btnCheck3.isSelected.toggle()
    }
    
    // 약관 동의
    @IBAction func btnCheck1(_ sender: Any) {
        if btnCheck1.isSelected{
            btnCheck1.setImage(imgUnCheck, for: .normal)
  
        }else{
            btnCheck1.setImage(imgCheck, for: .normal)
        }
        btnCheck1.isSelected.toggle()
    }
    
    @IBAction func btnCheck2(_ sender: Any) {
        if btnCheck2.isSelected{
            btnCheck2.setImage(imgUnCheck, for: .normal)
        }else{
            btnCheck2.setImage(imgCheck, for: .normal)
        }
        btnCheck2.isSelected.toggle()
    }
    
    @IBAction func btnCheck3(_ sender: Any) {
        if btnCheck3.isSelected{
            btnCheck3.setImage(imgUnCheck, for: .normal)
        }else{
            btnCheck3.setImage(imgCheck, for: .normal)
        }
        btnCheck3.isSelected.toggle()
    }
    
    //회원가입 완료 버튼
    @IBAction func btnRegister(_ sender: Any) {
    }
    //return 시 키보드 내리기
    func setKeyboardDelegate()  {
        labelEmail.delegate = self
        labelName.delegate = self
        labelPassword.delegate = self
        labelPasswordCheck.delegate = self
        labelPhoneNumber.delegate = self
        labelRecommendCode.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


