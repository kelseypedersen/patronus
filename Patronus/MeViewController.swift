//
//  MeViewController.swift
//  Patronus
//
//  Created by Monica Sun on 7/12/15.
//  Copyright (c) 2015 Monica Sun. All rights reserved.
//

import UIKit

class MeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var meImage: UIImageView!
    @IBOutlet weak var meName: UILabel!
    
    var numReports: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          self.navigationController?.navigationBar.backgroundColor = UIColor.lightGrayColor()
//        self.navigationController?.navigationBar.backgroundColor = UIColor(red: (43/255), green: (11/255), blue: (90/255), alpha: 1.0)
        
        meImage.layer.cornerRadius = 5
        numReports = 1
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numReports
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myReportCell", forIndexPath: indexPath) as! MyReportCell
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
