//
//  NSDate+Extension.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 11.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import Foundation

extension NSDate{
    func formatDate() -> String{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "M/d/yy  H:mm"
        return dateFormatter.stringFromDate(self)
    }
}