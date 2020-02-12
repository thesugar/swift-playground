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
        let actionSheet = UIAlertController(title: "確認",
                                            message: "履歴を削除すると、元に戻せません。本当に削除しますか？",
                                            preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        let removeAction = UIAlertAction(title: "削除", style: .destructive) { action in
            self.textView.text = ""
        }
        
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(removeAction)

        present(actionSheet, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
