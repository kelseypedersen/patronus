//
//  FriendCell.swift
//  Patronus
//
//  Created by Monica Sun on 7/12/15.
//  Copyright (c) 2015 Monica Sun. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendStatus: UILabel!
    @IBOutlet weak var friendPhoneNumber: UILabel!
    
    var friend: Person!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        friendImage.layer.cornerRadius = 5
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
