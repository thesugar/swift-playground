import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textView: UITextView!

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        // メソッドを抜ける際に、入力値をクリアして編集状態を終了する
        defer {
            textField1.text = ""
            textField2.text = ""
            view.endEditing(true)
        }

        // 正しく整数が入力された場合のみ、計算してテキストビューに結果を表示
        if let number1 = Int(textField1.text!), let number2 = Int(textField2.text!) {
            let result = number1 + number2
            let expression = "\(number1) + \(number2) = \(result)\n"

            // テキストビューに、計算結果の文字列を追記
            textView.text = textView.text! + expression
        }
    }

    @IBAction func clearButtonTapped(_ sender: UIButton) {
        // create action sheet
        let sheet = UIAlertController(title: "計算履歴削除確認", message: "本当に削除しますか？", preferredStyle: .actionSheet)
        
        // create delete button
        let removeAction = UIAlertAction(title: "削除実行", style: .destructive) { (action) in
            self.textView.text = ""
        }
        
        // create cancel button (not displayerd in iPad)
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        
        // add buttons into action sheet
        sheet.addAction(removeAction)
        sheet.addAction(cancelAction)
        
        sheet.popoverPresentationController?.sourceView = view
        sheet.popoverPresentationController?.sourceRect = sender.frame
        
        // display action sheet
        present(sheet, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
