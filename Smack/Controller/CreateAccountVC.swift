//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Georg on 22.09.17.
//  Copyright © 2017 Georg. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBAction func closedPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
