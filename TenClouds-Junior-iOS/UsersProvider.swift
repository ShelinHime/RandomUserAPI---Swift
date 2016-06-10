//
//  UsersProvider.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 09.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserProvider: NSObject {
    let baseURL = "http://api.randomuser.me/?results=50&nat=gb,us"
    
    func getRandomUsers(onCompletion: (JSON) -> Void){
        requestUsers(baseURL, onCompletion: {json, err in
            onCompletion(json as JSON)
        })
    }
    
    func requestUsers(path: String, onCompletion: (JSON, NSError?) -> Void){
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error -> Void in
            if let jsonData = data {
                let json: JSON = JSON(data: jsonData)
                onCompletion(json, error)
            }
            else{
                debugPrint("JSON - Error" + error!.description)
                onCompletion(nil, error)
            }
            
        })
        task.resume()
    }
}