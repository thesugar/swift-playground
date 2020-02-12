import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        // 入力値を取得し、整数に変換
        let number1: Int? = Int(textField1.text!)
        let number2: Int? = Int(textField2.text!)

        let resultMessage: String

        if let number1 = number1, let number2 = number2 {
            // 両方とも整数が入力されていた場合
            let result = number1 + number2
            resultMessage = "\(number1) + \(number2) = \(result)"
        } else {
            // 整数が入力されていなかった場合
            resultMessage = "整数を入力してください。"
        }

        // アラートダイアログを作成
        let alert = UIAlertController(title: "計算結果",
                                      message: resultMessage,
                                      preferredStyle: .alert)

        // OKボタンを作成、クリックされたら現在の入力値をクリアするようにhandlerに指定
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            self.textField1.text = ""
            self.textField2.text = ""
            self.view.endEditing(true)
        }

        // アラートダイアログにOKボタンを追加
        alert.addAction(okAction)

        // アラートダイアログを表示
        present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
