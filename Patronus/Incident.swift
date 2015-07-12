//
//  Incident.swift
//  Patronus
//
//  Created by Monica Sun on 7/12/15.
//  Copyright (c) 2015 Monica Sun. All rights reserved.
//

import UIKit

class Incident: NSObject {
    
    var id: Int?
    var survivor_id: Int?
    var message: String?
    var latCoordinate: Double?
    var longCoordinate: Double?
    var datetime: String?
    
    init(dict: NSDictionary) {
        super.init()
        
        self.id = dict["id"] as? Int
        self.survivor_id = dict["survivor_id"] as? Int
        self.message = dict["text_message_body"] as? String
        self.latCoordinate = dict["location_latitude"] as? Double
        self.longCoordinate = dict["location_longitude"] as? Double
        self.datetime = dict["date_time"] as? String
    }

}
