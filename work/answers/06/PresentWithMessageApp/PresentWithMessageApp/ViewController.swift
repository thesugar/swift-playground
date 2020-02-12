import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        // unwindセグエで戻ったタイミングで、テキストフィールドを空にする
        textField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 遷移先ビューコントローラを取得
        guard let dest = segue.destination as? SecondViewController else { return }

        // タップされたボタンを取得
        guard let button = sender as? UIButton else { return }

        // タップされたボタンのtagプロパティの内容を、遷移先へ渡す
        dest.presentNumber = button.tag

        // 入力されたメッセージを、遷移先へ渡す
        dest.message = textField.text
    }
}
