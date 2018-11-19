import UIKit
import Foundation

extension UIViewController {
    func alert(title: String, message: String,actionTexts: [String]? = nil, actions: [UIAlertAction] = [], style: UIAlertController.Style = UIAlertController.Style.alert, animated: Bool = true, completion: (() -> Void)? = nil) {
        let dialog = UIAlertController(title: title, message: message, preferredStyle: style)
        if actionTexts != nil {
            actionTexts?.forEach({
                body in dialog.addAction(UIAlertAction(title: body, style: UIAlertAction.Style.default, handler: nil))
            })
        } else {
            actions.forEach(dialog.addAction)
        }
        present(dialog, animated: animated, completion: completion)
    }
}
