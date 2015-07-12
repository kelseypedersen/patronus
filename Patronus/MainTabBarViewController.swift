//
//  MainTabBarViewController.swift
//  Patronus
//
//  Created by Monica Sun on 7/12/15.
//  Copyright (c) 2015 Monica Sun. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    var lastSelectedTabIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lastSelectedTabIndex = 0
        
        if let tabs = self.tabBar.items as! [UITabBarItem]? {
            tabs[0].image = UIImage(named: "me")
            tabs[0].title = "Me"
            tabs[1].image = UIImage(named: "friends")
            tabs[1].title = "Friends"
            tabs[2].image = UIImage(named: "community")
            tabs[2].title = "Community"
        } else {
            NSLog("ERROR: tabs is nil!")
        }
        
        if let vcs = self.viewControllers as! [UIViewController]? {
            let meVC: MeViewController = vcs[0] as! MeViewController
            
            let friendsVC: FriendsViewController = vcs[1] as! FriendsViewController
            
            let communityVC: CommunityViewController = vcs[2] as! CommunityViewController
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        let viewController = viewController as UIViewController
        
//        switch(tabBarController.selectedIndex) {
//        case 0:
//            
//        case 1:
//            //
//        default:
//            NSLog("Unexpected tabBar selectedIndex: \(tabBarController.selectedIndex)!")
//        }
        
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectItem: UITabBarItem) {
        lastSelectedTabIndex = tabBarController.selectedIndex
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




