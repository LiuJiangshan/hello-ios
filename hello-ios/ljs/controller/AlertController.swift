//
//  AlertController.swift
//  hello-ios
//
//  Created by ljs on 2018/11/16.
//  Copyright © 2018 ljs. All rights reserved.
//

import UIKit

class AlertController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert(_ sender: UIButton) {
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

    @IBAction func showActionSheet() {
        let sheet = UIAlertController(title: "题目", message: "消息内容", preferredStyle: UIAlertController.Style.actionSheet)
        let helloAction = UIAlertAction(title: "hello", style: UIAlertAction.Style.default, handler: { print($0) })
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel, handler: { print($0) })
        let resetAction = UIAlertAction(title: "reset", style: UIAlertAction.Style.destructive, handler: { print($0) })
        sheet.addAction(helloAction)
        sheet.addAction(cancelAction)
        sheet.addAction(resetAction)
        present(sheet, animated: true, completion: nil)
    }
}
