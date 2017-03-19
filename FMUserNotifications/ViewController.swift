//
//  ViewController.swift
//  FMUserNotifications
//
//  Created by WuQiang on 2017/3/19.
//  Copyright © 2017年 WuQiang. All rights reserved.
//




// Listing 19-11: Scheduling a notification
import UIKit
import UserNotifications

class ViewController: UIViewController {
    @IBOutlet weak var messageField: UITextField!
    
    @IBAction func saveNotification(_ sender: UIButton) {
        let notificationcenter = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = messageField.text!
        // Listing 19-12: Scheduling a notification with sound
        content.sound = UNNotificationSound(named: "alarm.mp3")
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
        
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        notificationcenter.add(request, withCompletionHandler: { (error) in
            let main = OperationQueue.main
            main.addOperation({
                self.messageField.text = "试试"
            })
        })
    }
}
