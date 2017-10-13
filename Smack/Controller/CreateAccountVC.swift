//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Georg on 22.09.17.
//  Copyright © 2017 Georg. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            print("\(UserDataService.instance.avatarName)")
            profileImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColor == nil {
                profileImg.backgroundColor = UIColor.lightGray
            }
        }
    }
    @IBAction func closedPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
   
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let name = usernameTxt.text, usernameTxt.text != "" else {return}
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let pass = passwordTxt.text, passwordTxt.text != "" else {return}
        
//        spinner.isHidden = false
//        spinner.startAnimating()
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if (success) {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if (success) {
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func generateBGPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.2) {
        self.profileImg.backgroundColor = self.bgColor
        }
    }
    
    func setUpView() {
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "USERNAME", attributes: [NSAttributedStringKey.foregroundColor : SMACK_PLACEHOLDER]
        )
        emailTxt.attributedPlaceholder = NSAttributedString(string: "EMAIL", attributes: [NSAttributedStringKey.foregroundColor : SMACK_PLACEHOLDER]
        )
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "PASSWORD", attributes: [NSAttributedStringKey.foregroundColor : SMACK_PLACEHOLDER]
        )
        spinner.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
