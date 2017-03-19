//
//  ViewController.swift
//  FMUserNotifications
//
//  Created by WuQiang on 2017/3/19.
//  Copyright © 2017年 WuQiang. All rights reserved.
//






// Listing 19-13: Showing notifications when the app is being used

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    @IBOutlet weak var messageField: UITextField!
    
    @IBAction func saveNotification(_ sender: UIButton) {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = messageField.text!
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        
        let notificationcenter = UNUserNotificationCenter.current()
        notificationcenter.add(request, withCompletionHandler: { (error) in
            let main = OperationQueue.main
            main.addOperation({
                self.messageField.text = ""
            })
        })
    }
    // 当 Notifications 被触发 并且 App 正在运行的时候 会调用这个 方法 。
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert])
        print("WQ_The closure has benn returned!")
    }
}
