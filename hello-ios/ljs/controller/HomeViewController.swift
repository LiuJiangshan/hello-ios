import UIKit
import UserNotifications

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var options:[String] = []
    var clicks:[()->Void] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "\(indexPath)")
        cell.textLabel?.text = options[indexPath.row]
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clicks[indexPath.row]()
    }

    let logger = Logger("ViewController", false)

    @IBOutlet weak var tableView: UITableView!
    
    func navToWebViewTest() {
        performSegue(withIdentifier: "webViewTest", sender: nil)
    }
    
    func navToAlertTest() {
        performSegue(withIdentifier: "alertTest", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        logger.d("视图已创建")
        
        clicks = [navToWebViewTest, navToAlertTest, showNotification]
        options = ["WebView测试", "对话框测试", "消息推送测试"]
        
        tableView.dataSource = self
        tableView.delegate = self
        // 取消下划线
        tableView.tableFooterView = UIView(frame: CGRect())
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        logger.d("视图将可见")
    }

    override func viewDidAppear(_ animated: Bool) {
        logger.d("视图已可见")
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        logger.d("视图将消失")
    }

    override func viewDidDisappear(_ animated: Bool) {
        logger.d("视图已消失")
    }

    override func didReceiveMemoryWarning() {
        logger.d("收到剩余内存过低警告")
    }
    
    func showNotification() {
        //(options: UNAuthorizationOptions = [], completionHandler: @escaping (Bool, Error?) -> Void)
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            [unowned self] (granted, error) in
            if true {
                let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil))

                if granted {
                    let timeInterval:Double = 10
                    let content = UNMutableNotificationContent()
                    content.badge = 1
                    content.title = "我是通知标题"
                    content.subtitle = "我是子标题"
                    content.body = "我是通知内容"
                    content.sound = UNNotificationSound.default
                    content.categoryIdentifier = DefaultTestIdentifier
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
                    let identifier = "id:\(Int.random(in: 0...9999))"
                    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                    
                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                    
                    alert.message = "本地消息推送成功(延迟:\(timeInterval)秒),\(identifier)"
                    alert.title = "推送成功"
                } else {
                    alert.message = "没有权限无法推送"
                    alert.title = "推送失败"
                }
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
