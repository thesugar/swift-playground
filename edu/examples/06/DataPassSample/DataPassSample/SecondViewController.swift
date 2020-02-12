import UIKit

class SecondViewController: UIViewController {

    /// 表示するデータの番号を受け取るためのプロパティ
    var imageIndex: Int?

    /// 表示するデータの一覧
    let images: [(fileName: String, description: String)] = [
        ("raspberry", "フランボワーズとも呼ばれます。"),
        ("strawberry", "ケーキには欠かせません。")
    ]

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 前画面から渡されたデータの番号をもとに、画像と説明を表示
        let imageData = images[imageIndex ?? 0]
        imageView.image = UIImage(named: imageData.fileName)
        label.text = imageData.description
    }
}
