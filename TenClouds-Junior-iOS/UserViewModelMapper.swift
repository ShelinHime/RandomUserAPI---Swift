//
//  UserViewModelMapper.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 09.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class UserViewModelMapper {
    static func create(userData: JSON, onCompletion: () -> Void){

        let realm = try! Realm()
        var idIncr = 0;
        //getting users
        let channelsArray = userData["results"].array
        
        for entry in channelsArray! {
            let id: String = String(idIncr)
            let name: String = entry["name"]["first"].string!
            let surname: String = entry["name"]["last"].string!
            let imageURL: String = entry["picture"]["medium"].string!
            let gender: String = entry["gender"].string!
            let email: String = entry["email"].string!
            let cellPhone: String = entry["cell"].string!
            let date = NSDate()
            
            try! realm.write{
                realm.create(User.self, value: [id, name, surname, imageURL, gender, email, cellPhone, date])
            }
            idIncr += 1
        }

        dispatch_async(dispatch_get_main_queue(), {
            debugPrint("create - JSON mapped")
            onCompletion()
        })
    }
}
