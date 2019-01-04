//
//  ViewController2.swift
//  samplecode
//
//  Created by kk on 1/2/19.
//  Copyright © 2019 kk. All rights reserved.
//

import UIKit

class ViewController2: UIViewController ,UITableViewDelegate, UITableViewDataSource {
   
    
 let shareData = ShareData.sharedInstance
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
    print("Hello \(self.shareData.someString)")
        // Do any additional setup after loading the view.
        
       
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.shareData.someString.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier , for: indexPath)
        // cell.textLabel?.text = self.arrRes[indexPath.row]["gender"] as? String
        cell.textLabel?.text = self.shareData.someString[indexPath.row]["email"] as? String
        return cell
        
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
