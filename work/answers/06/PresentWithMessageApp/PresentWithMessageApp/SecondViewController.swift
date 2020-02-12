import UIKit

class SecondViewController: UIViewController {
    
    /// プレゼント画像名の配列
    let imageNames = ["suit", "glasses"]

    /// メッセージ受け取り用
    var message: String?
    
    /// プレゼントの番号受け取り用
    var presentNumber: Int?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 前画面から受け取った内容を元に、ビューの表示内容を設定
        let imageName = imageNames[presentNumber ?? 0]
        imageView.image = UIImage(named: imageName)
        
        label.text = message
    }
}
