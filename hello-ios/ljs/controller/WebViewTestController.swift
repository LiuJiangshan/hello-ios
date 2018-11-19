import UIKit
import WebKit

class WebViewTestController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addressTextField: UITextField!

    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        addressTextField.delegate = self
    }

    private func openAddress() {
        addressTextField.resignFirstResponder()
        let address: String = addressTextField.text ?? "https://www.apple.com"
        if let url = URL(string: address) {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        openAddress()
        return true
    }
}
