//
//  Connectivity.swift
//  samplecode
//
//  Created by kk on 1/2/19.
//  Copyright © 2019 kk. All rights reserved.
//

import Foundation
import Alamofire
class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
