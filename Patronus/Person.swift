//
//  Person.swift
//  Patronus
//
//  Created by Monica Sun on 7/12/15.
//  Copyright (c) 2015 Monica Sun. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    // Victim or Supporter
    var id: Int?
    var name: String?
    var streetAddr: String?
    var zip: String?
    var phoneNumber: String?
    var attackerPhoneNumber: String?
    var checkIn: Int?
    
    init(dict: NSDictionary) {
        super.init()
        
        self.id = dict["id"] as? Int
        self.name = dict["name"] as? String
        self.streetAddr = dict["street_address"] as? String
        self.zip = dict["zip_code"] as? String
        self.phoneNumber = dict["survivor_phone_number"] as? String
        self.attackerPhoneNumber = dict["attacker_phone_number"] as? String
        self.checkIn = dict["check_in"] as? Int
    }
   
//    init(id: Int, name: String, streetAddr: String, zip: String, phoneNumber: String, attackerPhoneNumber: String, checkIn: Int) {
//        super.init()
//        
//        self.id = id
//        self.name = name
//        self.streetAddr = streetAddr
//        self.zip = zip
//        self.phoneNumber = phoneNumber
//        self.attackerPhoneNumber = attackerPhoneNumber
//        self.checkIn = checkIn
//    }
   
   
}
