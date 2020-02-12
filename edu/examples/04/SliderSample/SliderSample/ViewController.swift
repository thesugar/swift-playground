import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        // スライダーの現在値からCGFloatをs作成し、イメージビューのalphaプロパティに設定
        imageView.alpha = CGFloat(sender.value)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // スライダーの現在値からCGFloatを作成し、イメージビューのalphaプロパティに設定
        imageView.alpha = CGFloat(slider.value)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // イメージビューのcenterプロパティを取得し、ラベルに表示
        label.text = "(\(imageView.center.x), \(imageView.center.y))"
    }
}
