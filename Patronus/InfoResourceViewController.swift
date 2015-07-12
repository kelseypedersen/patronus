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
    var rowPosition: Int!
    
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
        cell.textLabel!.font  = UIFont.systemFontOfSize(14);
        cell.textLabel!.numberOfLines = 0;
        
        switch (infoSectionToShow) {
        case 1:
            if (indexPath.row == 1) { cell.textLabel?.text = "What is Domestic Violence?\nFrom National Coalition Against Domestic Violence" }
            else if (indexPath.row == 2) { cell.textLabel?.text = "About Domestic Violence\nFrom Violence Against Women" }
            else if (indexPath.row == 3) { cell.textLabel?.text = "What Is Abuse?\nFrom The National Domestic Violence Hotline" }
            else if (indexPath.row == 4) { cell.textLabel?.text = "What Is Domestic Violence?\nFrom The US Dept of Justice" }

        case 2:
            if (indexPath.row == 1) { cell.textLabel?.text = "Help a Loved One or Friend\nFrom Domestic Abuse Intervention Services " }
            else if (indexPath.row == 2) { cell.textLabel?.text = "How to Help a Friend\nWho Is Being Abused From Violence Against Women" }
            else if (indexPath.row == 3) { cell.textLabel?.text = "Get Help for Someone Else?\nFrom Love Is Respect Org" }
        case 3:
            if (indexPath.row == 1) { cell.textLabel?.text = "Domestic Violence Safety Tips\nFrom National Resource Center on Domestic Violence"  }
            else if (indexPath.row == 2) { cell.textLabel?.text = "Safety Tips for You and Your Family\nFrom American Bar Association" }
            else if (indexPath.row == 3) { cell.textLabel?.text = "What Is Safety Planning?\nFrom The National Domestic Violence Hotline" }
            else if (indexPath.row == 4) { cell.textLabel?.text = "Help for Abused and Battered Women\nFrom HelpGuide.org" }
        case 4:
            if (indexPath.row == 1) { cell.textLabel?.text = "National Domestic Violence Hotline\n1-800-799-7233 or 1-800-787-3224 (TTY)"  }
            else if (indexPath.row == 2) { cell.textLabel?.text = "National Center for Victims of Crimes, Stalking Resource Center\n1-800-394-2255 or 1-800-211-7996 (TTY)" }
            else if (indexPath.row == 3) { cell.textLabel?.text = "National Teen Dating Abuse Helpline\n1-866-331-9474 or 1-866-331-8453 (TTY)" }
        default:
            NSLog("UNEXPECTED: \(indexPath.row)")
        }
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
