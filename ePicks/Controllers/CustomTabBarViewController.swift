//
//  SalonCustomTabBarViewController.swift
//  boothnoire
//
//  Created by Michael Westbrooks on 8/4/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import UIKit

class CustomTabBarViewController:
    UITabBarController,
    UITabBarControllerDelegate
{

    let arrayOfImagesForTabBar = [
        "inbox",
        "calendar",
        "listings",
        "profile"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension CustomTabBarViewController {
    func setupTabBarItems() {
        print(FIRAuthentication.currentUser.get("authorizedUser")?.email)
        let currentUserDict: [String: Any] = FIRAuthentication.currentUser.get("authorizedUser")!
        print(currentUserDict)
//        guard let arrayOfTabBarItems = self.tabBar.items else { return }
//        let selectedColor = UIColor.murkyGold
//        let unselectedColor = UIColor.tabBarUnselectedBlue
//        var count = 0
//        for tabBarItem in arrayOfTabBarItems {
//            tabBarItem.tag = count
//            tabBarItem.image = UIImage(named: arrayOfImagesForTabBar[count])
//            tabBarItem.selectedImage = UIImage(named: arrayOfImagesForTabBar[count] + "-selected")
//            tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: unselectedColor],
//                                              for: .normal)
//            tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: selectedColor],
//                                              for: .selected)
//            count += 1
//        }
    }
}
