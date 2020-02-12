import UIKit

class ViewController: UIViewController {
    
    /// 画像名の配列
    let imageNames = [
        "bird00",
        "bird01",
        "bird02",
        "bird03",
        "bird04",
        "bird05",
        "bird06"
    ]

    /// 表示中画像の番号
    var currentNumber = 0

    @IBOutlet weak var imageView: UIImageView!

    @IBAction func previousButtonTapped(_ sender: UIButton) {
        // 表示中の画像が最初なら、次は最後の画像を表示
        if currentNumber == 0 {
            currentNumber = imageNames.count - 1
        } else {
            currentNumber -= 1
        }

        imageView.image = UIImage(named: imageNames[currentNumber])
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // 表示中の画像が最後なら、次は最初の画像を表示
        if currentNumber == imageNames.count - 1 {
            currentNumber = 0
        } else {
            currentNumber += 1
        }

        imageView.image = UIImage(named: imageNames[currentNumber])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
