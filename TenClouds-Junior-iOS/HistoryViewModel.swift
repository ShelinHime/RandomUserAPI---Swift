//
//  HistoryViewModel.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 11.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import Foundation

class HistoryViewModel{
    var name: String
    var surname: String
    var gender: String
    var email: String
    var cellPhone: String
    var date: NSDate
    
    init(name: String, surname:String, gender:String, email:String, cellPhone:String){
        self.name = name
        self.surname = surname
        self.gender = gender
        self.email = email
        self.cellPhone = cellPhone
        self.date = NSDate()
    }

}