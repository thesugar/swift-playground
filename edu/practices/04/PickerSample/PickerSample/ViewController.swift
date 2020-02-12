import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    /// 画像の表示名とファイル名を持った、タプルの配列
    let imageNames: [(title: String, fileName: String)] = [
        ("シロクマ", "polar-bear"),
        ("ハリネズミ", "hedgehog"),
        ("リス", "squirrel"),
        ("フクロウ", "owl"),
        ("クラゲ", "jelly-fish")
    ]
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    // MARK: - Picker View DataSource

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageNames.count
    }
    
    // MARK: - Picker View Delegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageNames[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = UIImage(named: imageNames[row].fileName)
    }
}

