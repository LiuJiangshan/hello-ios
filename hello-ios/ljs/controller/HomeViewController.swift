import UIKit

class HomeViewController: UIViewController {

    let logger = Logger("ViewController", false)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        logger.d("视图已创建")
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
}

