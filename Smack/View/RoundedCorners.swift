//
//  RoundedCorners.swift
//  Smack
//
//  Created by Georg on 24.09.17.
//  Copyright © 2017 Georg. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCorners: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    override func awakeFromNib() {
         self.setUpView()
    }
    func setUpView() {
        self.layer.cornerRadius = cornerRadius
    }
    override func prepareForInterfaceBuilder() {
         super.prepareForInterfaceBuilder()
        self.setUpView()
    }
}
