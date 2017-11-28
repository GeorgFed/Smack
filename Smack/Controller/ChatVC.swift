//
//  ChatVC.swift
//  Smack
//
//  Created by Georg on 22.09.17.
//  Copyright © 2017 Georg. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    @IBOutlet weak var channelName: UILabel!
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
        MessageService.instance.findAllChannels { (success) in
            
        }
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            
        } else {
            channelName.text = "Please Log In"
        }
    }
    
    func updateWithChannel() {
        let channelN = MessageService.instance.selectedChannel?.name ?? ""
        channelName.text = "#\(channelN)"
    }
    
    @objc func channelSelected(_ : Notification) {
        updateWithChannel()
    }
    
    func onLoginGetMsgs() {
        MessageService.instance.findAllChannels { (success) in
            if success {
                // du stuff w/ channels
            }
        }
    }
}

