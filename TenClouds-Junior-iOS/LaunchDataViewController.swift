//
//  LaunchDataViewController.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 10.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import UIKit
import RealmSwift
import ReachabilitySwift

class LaunchDataViewController: UIViewController {
    
    
    var userProvider = UserProvider()
    var activityIndicatorView = UIView()
    var reachability: Reachability?
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        configReachability()
        //Check for reachability
        if reachability!.isReachable(){
            //Rewrite data
            let realm = try! Realm()
            try! realm.write {debugPrint("DELETED - Realm")
                realm.deleteAll() }
            
            userProvider.getRandomUsers({ (users) in
                UserViewModelMapper.create(users, onCompletion: {
                    self.changeForIndicator(false)
                    self.performSegueWithIdentifier(SplashScreenSegues.segueToUserList, sender: self)
                })
            })
        }
            //Show saved data
        else{
            self.performSegueWithIdentifier(SplashScreenSegues.segueToUserList, sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeForIndicator(true)
    }
    
    
    private func changeForIndicator(isBusy: Bool){
        if (isBusy){
            self.activityIndicatorView.addDownloadUsersView(self.view.frame)
            self.view.addSubview(self.activityIndicatorView)
        }
        else {
            self.activityIndicatorView.removeFromSuperview()
        }
    }
    
    private func configReachability(){
        do {
            reachability = try Reachability.reachabilityForInternetConnection()
        } catch {
            debugPrint("Unable to create Reachability")
            return
        }
    }
    
}

struct SplashScreenSegues{
    static let segueToUserList = "segueToUserList"
}
