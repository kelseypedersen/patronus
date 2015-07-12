//
//  ReportIncidentViewController.swift
//  Patronus
//
//  Created by Monica Sun on 7/12/15.
//  Copyright (c) 2015 Monica Sun. All rights reserved.
//

import UIKit

class ReportIncidentViewController: UIViewController {
    
    @IBOutlet weak var reportTitle: UITextField!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var reportDescription: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func submitButtonClicked(sender: AnyObject) {
        performSegueWithIdentifier("submitIncidentReport", sender: self)
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "submitIncidentReport" {
            let meVC = segue.destinationViewController as! MeViewController
            
            var dict = Dictionary<String, AnyObject>()
            dict["id"] = 1
            dict["survivor_id"] = 1
            dict["text_message_body"] = reportDescription.text as String!
            dict["date_time"] = String("12:30pm July 12, 2015")
            var newIncident = Incident(dict: dict)            
            meVC.newIncident = newIncident
        }
    }

}
