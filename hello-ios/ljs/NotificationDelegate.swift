import Foundation
import UserNotifications
import UIKit

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    
    var app: AppDelegate? = nil
    
    // 后台通知栏事件处理
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let request = response.notification.request
        let content = request.content
        
        if content.categoryIdentifier == DefaultTestIdentifier {
            app?.window?.rootViewController?.alert(title: content.title, message: "处于后台收到:\(content.body),\(request.identifier)", actionTexts: ["确定"])
        }
        completionHandler()
    }

    // 前台通知栏事件处理
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let request = notification.request
        let content = request.content
        
        if  content.categoryIdentifier == DefaultTestIdentifier {
            app?.window?.rootViewController?.alert(title: content.title, message: "处于前台收到:\(content.body),\(request.identifier)", actionTexts: ["确定"])
        }
    }
}

