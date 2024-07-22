//
//  AppDelegate.swift
//  iBanki
//
//  Created by Mauro Magno on 05/06/24.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = LoginViewController()
//        window?.rootViewController = AccountSummaryViewController()
        window?.rootViewController = OnboardingContainerViewController()

        return true
    }
}
