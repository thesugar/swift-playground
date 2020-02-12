import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // プログラムからバッジを操作可能
        tabBarItem.badgeValue = "10"
    }
}
