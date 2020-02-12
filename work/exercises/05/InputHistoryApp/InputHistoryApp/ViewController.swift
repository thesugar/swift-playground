import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!

    @IBAction func addButtonTapped(_ sender: UIButton) {
        defer {
            textField.text = ""
            view.endEditing(true)
        }

        // 未入力でなければ、入力内容をテキストビューに追加
        if let text = textField.text, !text.isEmpty {
            textView.text = "\(textView.text!)\(text)\n"
        }
    }

    @IBAction func clearButtonTapped(_ sender: UIButton) {
        // TODO: アクションシートを表示し、削除をタップした場合はテキストビューの内容をクリア



    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
