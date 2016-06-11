//
//  UIImageView+Extension.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 10.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImageWithUrl(url: String) {
        if let url = NSURL(string: url) {
            if let data = NSData(contentsOfURL: url) {
                self.image = UIImage(data: data)
                self.clipsToBounds = true
                self.layer.borderWidth = 2
                self.layer.borderColor = UIColor.whiteColor().CGColor
            }
        }
    }
}