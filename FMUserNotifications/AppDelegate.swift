//
//  AppDelegate.swift
//  FMUserNotifications
//
//  Created by WuQiang on 2017/3/19.
//  Copyright © 2017年 WuQiang. All rights reserved.
//



// Listing 19-10: Asking permission to the user
import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        let notificationcenter = UNUserNotificationCenter.current()
        notificationcenter.requestAuthorization(options: [.alert, .sound], completionHandler: { (granted, error) in
            if granted && error == nil {
                print("Permission Granted")
            }
        })
        return true
    }
}
