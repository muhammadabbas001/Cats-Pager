//
//  AppDelegate.swift
//  CatsApp
//
//  Created by Zeeshan Suleman on 27/03/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootNavigationController : UINavigationController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = ViewController.create(storyboard: "Main")
        rootNavigationController = UINavigationController(rootViewController: rootViewController)
        self.window?.rootViewController = rootNavigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

