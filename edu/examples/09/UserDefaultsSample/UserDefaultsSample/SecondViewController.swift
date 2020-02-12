import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        // セグメントの選択値を取得
        let selectedIndex = sender.selectedSegmentIndex

        // UserDefaultsオブジェクトを取得
        let defaults = UserDefaults.standard

        // UserDefaultsに、セグメントの選択値を保存（キーに "colorIndex" を指定）
        defaults.set(selectedIndex, forKey: "colorIndex")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 画面表示時にあらかじめ、保存済みの値をもとにセグメントの項目を選択
        let defaults = UserDefaults.standard
        let colorIndex = defaults.integer(forKey: "colorIndex")
        segment.selectedSegmentIndex = colorIndex
    }
}
