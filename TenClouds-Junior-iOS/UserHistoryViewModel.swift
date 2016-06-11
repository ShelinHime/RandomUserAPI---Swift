//
//  UserHistoryViewModel.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 10.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import Foundation
import RealmSwift

@objc protocol UserHistoryViewModelDelegate{
    optional func updateUser(user: User) -> Void
}

class UserHistoryViewModel: UserHistoryViewModelDelegate{
    
    var delegate: UserHistoryViewModelDelegate?
    var results: Results<(UserHistory)>!
    var realm: Realm!
    
    func initializeData(userid: Int){
        realm = try! Realm()
        results = realm.objects(UserHistory).filter("id = %@", userid)
    }
    
    func addEdit(userid: Int){
        let user = realm.objects(User).filter("id = %@", userid).first
        realm.beginWrite()
        let oldUser = UserHistory()
        oldUser.id = findMaxPrimaryKey()
        oldUser.userid = user!.id
        oldUser.name = user!.name
        oldUser.surname = user!.surname
        oldUser.gender = user!.gender
        oldUser.email = user!.email
        oldUser.cellPhone = user!.cellPhone
        oldUser.date = NSDate()
        realm.add(oldUser)
        try! realm.commitWrite()
    }
    
    func saveUpdate(userid: Int, name: String, surname:String, gender: String, email: String, cellPhone: String, imageURL: String){
        let newUser = User()
        newUser.id = userid
        newUser.name = name
        newUser.surname = surname
        newUser.gender = gender
        newUser.email = email
        newUser.cellPhone = cellPhone
        newUser.imageURL = imageURL
        newUser.date = NSDate()
        try! realm.write {
            realm.add(newUser, update: true)
        }
        delegate?.updateUser!(newUser)
    }
    
    private func findMaxPrimaryKey() -> Int{
        let result = realm.objects(UserHistory).map{$0.id}.maxElement() ?? 0
        let maxKey = result + 1
        return maxKey
    }

}