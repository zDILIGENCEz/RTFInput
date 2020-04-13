//
//  RootRouter.swift
//  RTFInput_Example
//
//  Created by Kusyumov Nikita on 13.04.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class RootRouter {

    /** Replaces root view controller. You can specify the replacment animation type.
     If no animation type is specified, there is no animation */
    func setRootViewController(controller: UIViewController, animatedWithOptions: UIView.AnimationOptions?) {
        guard let window = UIApplication.shared.keyWindow else {
            fatalError("No window in app")
        }
        if let animationOptions = animatedWithOptions, window.rootViewController != nil {
            window.rootViewController = controller
            UIView.transition(with: window, duration: 0.33, options: animationOptions, animations: {
            }, completion: nil)
        } else {
            window.rootViewController = controller
        }
    }

    func loadMainAppStructure() {
        let controller = MainViewController()
        setRootViewController(controller: controller, animatedWithOptions: nil)
    }
}
