import UIKit

class DetailViewController: UIViewController {
    /// 表示する画像名の受け取り用
    var imageName: String = ""

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 画像を表示
        imageView.image = UIImage(named: imageName)
    }
}
