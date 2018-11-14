//
//  ViewController.swift
//  hello-ios
//
//  Created by yfn on 2018/11/13.
//  Copyright © 2018年 ljs. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate {

    let logger = Logger("ViewController", false)

    var count = 0

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var edit: UITextField!
    @IBOutlet weak var uiSwitch: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var urlEdit: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBAction func doneButton(_ sender: UIButton) {
        edit.resignFirstResponder()
    }

    @IBAction func openUrl(_ sender: UIButton) {
        urlEdit.resignFirstResponder()
        if let url = URL(string: urlEdit.text ?? "https://www.apple.com") {
            let urlRequest: URLRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }

    @IBAction func alertDown(_ sender: UIButton) {
        let alert = UIAlertController(title: "题目", message: "消息", preferredStyle: UIAlertController.Style.alert)

        func okHandler(action: UIAlertAction) {
        }

        let okAction = UIAlertAction(title: "确定",
                style: UIAlertAction.Style.default,
                handler: { (action: UIAlertAction) in print("\(action)") })
        let resetAction = UIAlertAction(title: "重置", style: UIAlertAction.Style.destructive, handler: nil)
        alert.addTextField(configurationHandler: {
            $0.textContentType = UITextContentType.username
            $0.text = "admin"
            $0.placeholder = "请输入用户名"
        })
        alert.addTextField(configurationHandler: {
            $0.isSecureTextEntry = true
            $0.text = "1234"
            $0.placeholder = "请输入密码"
        })
        alert.addAction(resetAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func onButtonDown(_ button: UIButton, forEvent event: UIEvent) {
        count += 1
        label.text = "ljs\(count)"
        edit.text = label.text
        edit.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        edit.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        logger.d("视图已创建")

        label.text = "hello ios"

        edit.delegate = self

        urlEdit.delegate = self

        activityIndicator.startAnimating()
    }

    override func viewWillAppear(_ animated: Bool) {
        logger.d("视图将可见")
    }

    override func viewDidAppear(_ animated: Bool) {
        logger.d("视图已可见")
    }

    override func viewWillDisappear(_ animated: Bool) {
        logger.d("视图将消失")
    }

    override func viewDidDisappear(_ animated: Bool) {
        logger.d("视图已消失")
    }

    override func didReceiveMemoryWarning() {
        logger.d("收到剩余内存过低警告")
    }
}

