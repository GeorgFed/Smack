//
//  ChannelVC.swift
//  Smack
//
//  Created by Georg on 22.09.17.
//  Copyright © 2017 Georg. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
}
    


