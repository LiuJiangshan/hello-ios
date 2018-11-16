import UIKit
import WebKit

class WebViewTestController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addressTextField: UITextField!

    @IBOutlet weak var webView: WKWebView!

    @IBOutlet weak var nav: UINavigationBar!

    override func viewDidLoad() {
        addressTextField.delegate = self
    }

    @IBAction func openAddress(_ sender: UIButton?) {
        addressTextField.resignFirstResponder()
        let address: String = addressTextField.text ?? "https://www.apple.com"
        if let url = URL(string: address) {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        openAddress(nil)
        return true
    }
}
