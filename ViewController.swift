//
//  ViewController.swift
//  samplecode
//
//  Created by kk on 12/26/18.
//  Copyright © 2018 kk. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireNetworkActivityIndicator

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let shareData = ShareData.sharedInstance
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    private let manager = NetworkReachabilityManager(host: "www.apple.com")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        if Connectivity.isConnectedToInternet()
        {
            self.alamofirewithPostMethod()

        
//        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
//            if((responseData.result.value) != nil) {
//                let swiftyJsonVar = JSON(responseData.result.value!)
//
//                if let resData = swiftyJsonVar["contacts"].arrayObject
//                {
//                    self.arrRes = resData as! [[String:AnyObject]]
////                    UserDefaults.standard.set(self.arrRes, forKey: "arr")
//                    self.shareData.someString = self.arrRes
//                    print(self.arrRes)
//                  //  print(self.arrRes[0]["phone"]!["home"] as? String)
//                    //UserDefaults.standard.string(forKey: "arr")
//                    print(UserDefaults.standard.string(forKey: "arr") as Any)
//                    self.alamofirewithPostMethod()
//                }
//                if self.arrRes.count > 0 {
//                    self.tableView.reloadData()
//                }
//
//           }
//     }
        }
        else
        {
            print("no Network")
        }
}
    func alamofirewithPostMethod() {
        
        
       let url = URL(string: "http://api.androidhive.info/contacts/")
        //let parameters: Parameters = ["username": "vicky@promantra.us","password": "promantra"]
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (responseData) -> Void in
            switch responseData.result
            {
            case .failure:
                // handle errors (including `validate` errors) here
                
                if let statusCode = responseData.response?.statusCode
                {
                    if statusCode == 409
                    {
                        // handle 409 specific error here, if you want
                    }
                }
            case .success(let value):
                // handle success here
                
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["contacts"].arrayObject
                {
                    self.arrRes = resData as! [[String:AnyObject]]
                    //                    UserDefaults.standard.set(self.arrRes, forKey: "arr")
                    self.shareData.someString = self.arrRes
                    print(self.arrRes)
                    //  print(self.arrRes[0]["phone"]!["home"] as? String)
                    //UserDefaults.standard.string(forKey: "arr")
                    print(UserDefaults.standard.string(forKey: "arr") as Any)
                }
                if self.arrRes.count > 0 {
                    self.tableView.reloadData()
                }
               
            }
            
        }

    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.arrRes.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier , for: indexPath)
       // cell.textLabel?.text = self.arrRes[indexPath.row]["gender"] as? String
        cell.textLabel?.text = self.arrRes[indexPath.row]["phone"]!["home"] as? String
        return cell
        
    }
     public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //let vc2 = ViewController2()
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        self.present(vc2, animated: true, completion: nil)
    }
}


