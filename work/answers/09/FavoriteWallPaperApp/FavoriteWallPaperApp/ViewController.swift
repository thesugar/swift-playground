import UIKit

class ViewController: UIViewController {
    
    /// 画像名の配列
    let imageNames = ["bird00", "bird01", "bird02", "bird03", "bird04"]

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var segment: UISegmentedControl!

    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        // セグメントの選択されたインデックスを取得
        let index = segment.selectedSegmentIndex

        // インデックスを元に、画像を変更
        imageView.image = UIImage(named: imageNames[index])

        // ユーザデフォルトを利用して、インデックスを永続化
        let defaults = UserDefaults.standard
        defaults.set(index, forKey: "selectedIndex")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ユーザデフォルトを利用して、永続化されたインデックスを取得
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "selectedIndex")

        // インデックスを元に、画像とセグメントの選択項目を変更
        imageView.image = UIImage(named: imageNames[index])
        segment.selectedSegmentIndex = index
    }
}
