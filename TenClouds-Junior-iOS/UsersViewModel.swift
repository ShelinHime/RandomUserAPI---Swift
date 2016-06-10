//
//  UsersViewModel.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 10.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import Foundation
import RealmSwift

@objc protocol UsersViewModelDelegate{
    func addUser() -> Void
}

class UsersViewModel{
    
    var delegate: UsersViewModelDelegate?
    var results: Results<(User)>!
    var realm: Realm!
    
    func initializeData(){
        realm = try! Realm()
        results = realm.objects(User)
    }
    
    func createNewUser(){
        realm.beginWrite()
        realm.create(User.self, value: [findMaxPrimaryKey(), "Johan", "Testowy", "https://randomuser.me/api/portraits/med/men/80.jpg", "male", "testowy.johan@email.com", "222-333-222", NSDate()])
        try! realm.commitWrite()
        delegate?.addUser()
    }
    
    private func findMaxPrimaryKey() -> Int{
        let result = realm.objects(User).map{$0.id}.maxElement() ?? 0
        let maxKey = result + 1
        return maxKey
    }
    
    
}