import UIKit

class ViewController: UIViewController {
    // TODO: ファイルのパス



    // TODO: ファイルの存在有無




    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func writeButtonTapped(_ sender: UIButton) {
        // メソッドを抜ける際の処理
        defer {
            textField.text = ""
            view.endEditing(true)
        }

        // 入力値の取得と未入力チェックし、末尾に改行文字を追加
        guard let s = textField.text, !s.isEmpty else { return }
        let line = s + "\n"

        // TODO: 永続化可能なDataに変換



        // TODO: ファイルの存在有無により追記または新規作成



    }

    @IBAction func showButtonTapped(_ sender: UIButton) {
        // TODO: ファイルが存在している場合のみ読み込み



    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
