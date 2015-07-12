//
//  DataAPI.swift
//  Patronus
//
//  Created by Monica Sun on 7/12/15.
//  Copyright (c) 2015 Monica Sun. All rights reserved.
//

import UIKit

class DataAPI: NSObject {
    // all users:
    let listAllSurvivorsUrl = "http://patronus-team.herokuapp.com/json?op=listSurvivors"
    // user's friends:
    let getSupportersBySurvivorIdUrl = "http://patronus-team.herokuapp.com/json?op=listSupporters&survivor_id="
    // all incidents
    let listAllIncidentsUrl = "http://patronus-team.herokuapp.com/json?op=listIncidents"
    // user's incidents
    let getIncidentsForSurvivorById = "http://patronus-team.herokuapp.com/json?op=listIncidents&survivor_id="
    
    let apiManager = AFHTTPRequestOperationManager()
   
    func listAllSurvivors(completion: (survivors: [Person], error: NSError?) -> ()) {
        var survivors = [Person]()
        
        apiManager.GET(listAllSurvivorsUrl, parameters: nil, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            println(response)
            
            if let dict = response as! NSDictionary! {
                if let rows = dict["rows"] as! [NSDictionary]? {
                    for row in rows {
                        var p = Person(dict: row)
                        survivors.append(p)
                    }
                    completion(survivors: survivors, error: nil)
                }
            }            
        }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
            println(error.description)
            completion(survivors: [], error: error)
        })
    }
    
    func getSupportersBySurvivorId(id: Int, completion: (supporters: [Person], error: NSError?) -> ()) {
        var supporters = [Person]()
        
        apiManager.GET(getSupportersBySurvivorIdUrl + String(id), parameters: nil, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            println(response)
            
            if let dict = response as! NSDictionary! {
                if let rows = dict["rows"] as! [NSDictionary]? {
                    for row in rows {
                        var p = Person(dict: row)
                        supporters.append(p)
                    }
                    completion(supporters: supporters, error: nil)
                }
            }
            }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error.description)
                completion(supporters: [], error: error)
        })
    }
    
    func listAllIncidents(completion: (incidents: [Incident], error: NSError?) -> ()) {
        var incidents = [Incident]()
        
        apiManager.GET(listAllIncidentsUrl, parameters: nil, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            println(response)
            
            if let dict = response as! NSDictionary! {
                if let rows = dict["rows"] as! [NSDictionary]? {
                    for row in rows {
                        var i = Incident(dict: row)
                        if i.message != nil && !i.message!.isEmpty {
                            incidents.append(i)
                        }
                    }
                    completion(incidents: incidents, error: nil)
                }
            }
            }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error.description)
                completion(incidents: [], error: error)
        })
    }
}
