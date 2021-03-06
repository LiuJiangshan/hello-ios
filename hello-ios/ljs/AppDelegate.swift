import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let logger = Logger("AppDelegate", false)

    let notificationDelegate = NotificationDelegate()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        logger.d("触摸事件开始")
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        logger.d("触摸事件结束")
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        logger.d("app启动")
        let center = UNUserNotificationCenter.current()
        notificationDelegate.app = self
        center.delegate = notificationDelegate
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        logger.d("app将被挂起")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        logger.d("app进入后台")
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        logger.d("app进入前台")
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        logger.d("app将复活")
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        logger.d("app将终止")
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

