import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var teaImageView: UIImageView!

    /// ビューが準備されたタイミングで呼ばれるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()

        // イメージビューへ画像を表示
        teaImageView.image = UIImage(named: "tea_cup")
    }
}
