//
//  AddChannelVCViewController.swift
//  Smack
//
//  Created by Georg on 10.11.17.
//  Copyright © 2017 Georg. All rights reserved.
//

import UIKit

class AddChannelVCViewController: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView();
    
    }

    func setUpView() {
        let closeGesture = UITapGestureRecognizer(target: self, action: #selector(AddChannelVCViewController.closeTap(_:)))
        bgView.addGestureRecognizer(closeGesture)
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor : SMACK_PLACEHOLDER])
        descriptionTxt.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor : SMACK_PLACEHOLDER])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil);
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelPressed(_ sender: Any) {
    }
    
}
