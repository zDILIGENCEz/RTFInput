//
//  AppDelegate.swift
//  RTFInput
//
//  Created by n.kusyumov@mail.ru on 04/13/2020.
//  Copyright (c) 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy private var router = RootRouter()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        router.loadMainAppStructure()
        return true
    }

}

