//
//  ShareData.swift
//  almofireproject
//
//  Created by kk on 12/19/18.
//  Copyright © 2018 kk. All rights reserved.
//

import UIKit

class ShareData: NSObject {
    static let sharedInstance = ShareData()
    
    
    var someString = [[String:AnyObject]]() //Some String
    
    var selectedTheme : AnyObject! //Some Object
    
    var someBoolValue : Bool!
    
}
