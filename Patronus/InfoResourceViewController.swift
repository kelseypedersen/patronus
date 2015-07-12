//
//  InfoResourceViewController.swift
//  Patronus
//
//  Created by Monica Sun on 7/12/15.
//  Copyright (c) 2015 Monica Sun. All rights reserved.
//

import UIKit

class InfoResourceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    var numRows: Int!
    var infoSectionToShow: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return numRows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("detailedInfoCell", forIndexPath: indexPath) as! DetailedInfoCell
        // TODO replace these w/ each section's rows
//        switch (infoSectionToShow) {
//        case 0:
//            cell.textLabel?.text = "What is Domestic Violence?"
//        case 1:
//            cell.textLabel?.text = "How to Help Loved Ones in Abusive Relationships"
//        case 2:
//            cell.textLabel?.text = "Domestic Violence Safety Tips"
//        case 3:
//            cell.textLabel?.text = "Domestic Violence Hotlines"
//        default:
//            NSLog("UNEXPECTED: \(indexPath.row)")
//        }
        
        return cell
    }
    
    
    @IBAction func backButtonClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
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
