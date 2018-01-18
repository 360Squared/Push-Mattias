//
//  NotificationManager.swift
//  notifications
//
//  Created by Mattias te Wierik on 29-11-17.
//  Copyright © 2017 Mattias te Wierik. All rights reserved.
//

import UIKit
import UserNotifications

enum NotificationActions: String {
    case HighFive = "mattleSampleNotifications"
}

class NotificationManager: NSObject {
    
    func registerForNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                self.setupAndGenerateLocalNotification()
            }
        }
        self.setupAndGenerateLocalNotification()
    }
    
    func setupAndGenerateLocalNotification() {
        // Register an Actionable Notification
        let highFiveAction = UNNotificationAction(identifier: NotificationActions.HighFive.rawValue, title: "High Fssive", options: [])
        let category = UNNotificationCategory(identifier: "wkkassup", actions: [highFiveAction], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: highFiveAction.title, options: [.customDismissAction])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        let highFiveContent = UNMutableNotificationContent()
        highFiveContent.title = "Wassssup?"
        highFiveContent.body = "Can Isss get a high five?"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let highFiveRequestIdentifier = "samplesRequest"
        let highFiveRequest = UNNotificationRequest(identifier: highFiveRequestIdentifier, content: highFiveContent, trigger: trigger)
        UNUserNotificationCenter.current().add(highFiveRequest) { (error) in
            // handle the error if needed
            print(error)
        }
    }
    
}

extension NotificationManager: UNUserNotificationCenterDelegate {
    
    private func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: () -> Void) {
        
        // Response has actionIdentifier, userText, Notification (which has Request, which has Trigger and Content)
        switch response.actionIdentifier {
        case NotificationActions.HighFive.rawValue:
            print("High Five Delivered!")
        default: break
        }
    }
    
    private func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        
        // Delivers a notification to an app running in the foreground.
    }
}
