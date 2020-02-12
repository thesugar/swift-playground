import UIKit

// ビューコントローラ自信を、ピッカービューのdataSourceとdelegateに準拠させる
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

        // ピッカービューのdataSourceとdelegateに、ビューコントローラ自身を指定
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    // MARK: - Picker view dataSource

    /// ピッカービューの1行に表示する列数を返す
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 今回は1列のみ表示
        return 1
    }

    /// ピッカービューに表示する行数を返す
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        // 配列の要素数分だけ表示
        return imageNames.count
    }

    // MARK: - Picker view delegate

    /// ピッカービューの各行を表示するタイミングで、表示する内容を文字列として返す
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        // 引数のrowには行番号が渡されるので、配列のrow番目のタプルのtitleを返す
        return imageNames[row].title
    }

    /// ピッカービューの行が選択されたタイミングの処理
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
                    inComponent component: Int) {
        // rowには行番号が渡されるので、配列のrow番目のタプルのfileNameを取得して処理
        imageView.image = UIImage(named: imageNames[row].fileName)
    }
}
