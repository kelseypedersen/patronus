//
//  FriendsViewController.swift
//  Patronus
//
//  Created by Monica Sun on 7/12/15.
//  Copyright (c) 2015 Monica Sun. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var numFriends: Int!
    var friends = [Person]()
    let dataAPI = DataAPI()
    let myId = 1    //TODO implement user login

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = UIColor.lightGrayColor()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        dataAPI.getSupportersBySurvivorId(self.myId, completion: { (supporters, error) -> () in
            if error != nil {
                NSLog("ERROR: getSupportersBySurvivorId: \(error)")
            } else {
                self.friends = supporters
                self.tableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as! FriendCell
        
        if indexPath.row < friends.count {
            var friend = friends[indexPath.row]
            cell.friend = friend
            cell.friendName.text = friend.name!
            if let status = friend.checkIn as Int! {
                if status == 0 {
                    cell.friendStatus.text = "Safe" //TODO need status field in Node app!
                } else {
                    cell.friendStatus.text = "In Danger"
                }
            } else {
                cell.friendStatus.text = "In Danger"
            }
            
            if let phoneNumber = friend.phoneNumber as String! {
                cell.friendPhoneNumber.text = friend.phoneNumber!
            } else {
                cell.friendPhoneNumber.text = " "
            }
        } else {
            NSLog("ERROR: indexPath.row: \(indexPath.row) invalid for friends.count: \(friends.count)")
        }
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
