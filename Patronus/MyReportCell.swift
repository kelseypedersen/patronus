//
//  MyReportCell.swift
//  Patronus
//
//  Created by Monica Sun on 7/12/15.
//  Copyright (c) 2015 Monica Sun. All rights reserved.
//

import UIKit

class MyReportCell: UITableViewCell {
    
    var incidentDescText = String()
    var incidentDateTime = String()
    
    @IBOutlet weak var incidentDesc: UILabel!
    @IBOutlet weak var datetime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
