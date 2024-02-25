//
//  TabBarViewController.swift
//  Exercise4_Likitha_Mandapatu
//
//  Created by Likitha Mandapati on 9/17/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewControllers = self.viewControllers {
            for viewController in viewControllers {
                let _ = viewController.view
            }
        }
    }
}
