//
//  UserHistoryViewModel.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 10.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import Foundation

@objc protocol UserHistoryViewModelDelegate{
    optional func editUser(user: User) -> Void
    optional func findUserHistory(user: User) -> UserHistory
}

class UserHistoryViewModel: UserHistoryViewModelDelegate{
    
}