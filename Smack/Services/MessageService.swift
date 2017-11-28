//
//  MessageService.swift
//  Smack
//
//  Created by Georg on 08.11.17.
//  Copyright © 2017 Georg. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()
    
    var channels = [Channel]()
    var selectedChannel : Channel?
    
    func findAllChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if (response.result.error == nil) {
                
                guard let data = response.data else { return }
                /*
                do {
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                } catch let error {
                    debugPrint(error as Any)
                }
 */
                
 
                if let json = JSON(data: data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        
                        let channel = Channel(_id: id, name: name, description: channelDescription)
                        self.channels.append(channel)
                    }
 
                    print(self.channels)
                    NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                    completion(true)
                }
                else {
                    completion(false)
                    debugPrint(response.result.error as Any)
            }
            }
        }
    }
    func clearChannels() {
        channels.removeAll()
    }
}
