//
//  LoginVC.swift
//  MOMMA
//
//  Created by macbook on 18/12/2022.
//

import UIKit

class LoginVC: UIViewController {


    @IBOutlet weak var btn_signup: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailFiled: UITextField!
    @IBOutlet weak var phoneFiled: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameField.addBottomLine()
        passwordField.addBottomLine()
        emailFiled.addBottomLine()
        phoneFiled.addBottomLine()
        
        btn_signup.layer.cornerRadius = 25
        // Initialization code
    }
    
    
    @IBAction func btnSignup(_ sender: Any) {
        print("Successfulloy")
    }
    
}


let eyeBtn = UIButton(type: .custom)
extension UITextField{
    func addBottomLine(){
       
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.bounds.height + 8, width: self.bounds.width, height: 1)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        self.layer.addSublayer(bottomLine)
        
    }
    
    func SetIconPassword(){
        eyeBtn.setImage(UIImage(systemName: "eye"), for: .normal)
        eyeBtn.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        eyeBtn.tintColor = .gray
        eyeBtn.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
        
        
    }
    @objc func togglePassword(){
        self.isSecureTextEntry.toggle()
        eyeBtn.isSelected.toggle()
    }

}
