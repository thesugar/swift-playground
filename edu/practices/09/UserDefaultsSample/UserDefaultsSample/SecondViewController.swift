import UIKit

class SecondViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        // UserDefaultsオブジェクトを取得（インスタンス化は不要）
        //let defaults = UserDefaults.standard
        
        // UserDefaultsに、セグメントの選択値を保存
        defaults.set(selectedIndex, forKey: "colorIndex")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let defaults = UserDefaults.standard
        let colorIndex = defaults.integer(forKey: "colorIndex")
        
        segment.selectedSegmentIndex = colorIndex
    }
}
