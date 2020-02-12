import UIKit

class ViewController: UIViewController {

    /// 画像の表示名とファイル名を持った、タプルの配列
    let imageNames: [(title: String, fileName: String)] = [
        ("シロクマ", "polar-bear"),
        ("ハリネズミ", "hedgehog"),
        ("リス", "squirrel"),
        ("フクロウ", "owl"),
        ("クラゲ", "jelly-fish")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

