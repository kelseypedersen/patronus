//
//  MyReportCell.swift
//  Patronus
//
//  Created by Monica Sun on 7/12/15.
//  Copyright (c) 2015 Monica Sun. All rights reserved.
//

import UIKit

class MyReportCell: UITableViewCell {
    var incident: Incident?
    var message = String()
    var datetimeString = String()
    var incidentDescText = String()
    var incidentDateTime = String()
    
    @IBOutlet weak var incidentDesc: UILabel!
    @IBOutlet weak var datetime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let incident = incident as Incident? {
            message = incident.message!
            datetimeString = incident.datetime!
            incidentDesc.text = incidentDescText
            datetime.text = incidentDateTime
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
