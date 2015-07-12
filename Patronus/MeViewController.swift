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
    @IBOutlet weak var phoneNum: UILabel!
    @IBOutlet weak var streetAddr: UILabel!
    
    var numReports: Int!
    let dataAPI = DataAPI()
    var survivors = [Person]()
    var me: Person!
    var myId = 1    // TODO: populate w/ user login id
    var incidents = [Incident]()
    
    var newIncident: Incident?
    
    override func viewDidLoad() {
        super.viewDidLoad()
          self.navigationController?.navigationBar.backgroundColor = UIColor.lightGrayColor()
//        self.navigationController?.navigationBar.backgroundColor = UIColor(red: (43/255), green: (11/255), blue: (90/255), alpha: 1.0)
        
        meImage.layer.cornerRadius = 5
        numReports = 1
        
        tableView.dataSource = self
        tableView.delegate = self
        
        if let newIncident = newIncident as Incident? {
            incidents.append(newIncident)
        }
        
        dataAPI.listAllSurvivors({ (survivors, error) -> () in
            if error != nil {
                NSLog("ERROR: listAllSurvivors: \(error)")
            } else {
                self.survivors = survivors
                for s in survivors {
                    if s.id == self.myId {
                        self.me = s
                        self.meName.text = s.name
                        self.phoneNum.text = s.phoneNumber
                        self.streetAddr.text = s.streetAddr
                    }
                }
            }
        })
        
        dataAPI.listAllIncidents({ (incidents, error) -> () in
            if error != nil {
                NSLog("ERROR: listAllIncidents: \(error)")
            } else {
                self.incidents = incidents
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
        return incidents.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myReportCell", forIndexPath: indexPath) as! MyReportCell
        if indexPath.row < incidents.count {
            let i = incidents[indexPath.row]
            cell.incident = i
            cell.incidentDesc.text = i.message!
            cell.datetime.text = i.datetime!
        } else {
            NSLog("ERROR: \(indexPath.row) invalid index for incidents.count: \(incidents.count)")
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
