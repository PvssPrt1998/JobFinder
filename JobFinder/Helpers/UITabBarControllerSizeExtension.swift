//
//  UITabBarControllerSizeExtension.swift
//  JobFinder
//
//  Created by Николай Щербаков on 28.06.2024.
//

import SwiftUI

extension UITabBarController {
    var height: CGFloat {
        return self.tabBar.frame.size.height
    }
    
    var width: CGFloat {
        return self.tabBar.frame.size.width
    }
}
