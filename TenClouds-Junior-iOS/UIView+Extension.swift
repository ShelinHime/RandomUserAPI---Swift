//
//  UIView+Extension.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 10.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addDownloadUsersView(controllerViewFrame: CGRect) {
        self.frame = CGRect(x: controllerViewFrame.midX - 90, y: controllerViewFrame.midY - 25, width: 180, height: 50)
        self.backgroundColor = UIColor.whiteColor()
        self.alpha = 0.8
        self.layer.cornerRadius = 10
        
        let textLabel = UILabel(frame: CGRect(x: 60, y: 0, width: 200, height: 50))
        textLabel.textColor = UIColor.grayColor()
        textLabel.text = "Getting Users"
        
        let busyView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        busyView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        busyView.startAnimating()
        
        self.addSubview(busyView)
        self.addSubview(textLabel)
        
    }
    
}