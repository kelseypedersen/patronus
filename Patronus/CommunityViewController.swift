//
//  CommunityViewController.swift
//  Patronus
//
//  Created by Monica Sun on 7/12/15.
//  Copyright (c) 2015 Monica Sun. All rights reserved.
//

import UIKit

class CommunityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var currentlySelectedRow: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = UIColor.lightGrayColor()
        
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
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath) as! InfoCell
        switch (indexPath.row) {
        case 0:
            cell.textLabel?.text = "What is Domestic Violence?"
        case 1:
            cell.textLabel?.text = "How to Help Loved Ones in Abusive Relationships"
        case 2:
            cell.textLabel?.text = "Domestic Violence Safety Tips"
        case 3:
            cell.textLabel?.text = "Domestic Violence Hotlines"
        default:
            NSLog("UNEXPECTED: \(indexPath.row)")
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        currentlySelectedRow = indexPath.row
        performSegueWithIdentifier("showMoreInfo", sender: tableView)
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMoreInfo" {
            let infoVC = segue.destinationViewController as! InfoResourceViewController
            switch currentlySelectedRow {
            case 0:
                infoVC.numRows = 4
                infoVC.infoSectionToShow = 1
            case 1:
                infoVC.numRows = 3
                infoVC.infoSectionToShow = 2
            case 2:
                infoVC.numRows = 4
                infoVC.infoSectionToShow = 3
            case 3:
                infoVC.numRows = 3
                infoVC.infoSectionToShow = 4
            default:
                NSLog("UNEXPECTED")
            }
        }
    }

}







