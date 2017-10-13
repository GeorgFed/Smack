//
//  CircleImg.swift
//  Smack
//
//  Created by Georg on 14.10.17.
//  Copyright © 2017 Georg. All rights reserved.
//

import UIKit
@IBDesignable

class CircleImg: UIImageView {
    override func awakeFromNib() {
        setUpView()
    }

    func setUpView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
}
