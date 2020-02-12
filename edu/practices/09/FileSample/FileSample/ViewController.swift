import UIKit

class ViewController: UIViewController {
    // TODO: ファイルのパス


    // TODO: ファイルの存在有無（Computedプロパティとして保持し、アクセスされるたびにチェック）

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // このメソッドを抜ける際に、テキストフィールドの入力値を削除して編集状態を終了する
        defer {
            textField.text = ""
            view.endEditing(true)
        }
        
        // 入力値を取得できた場合のみ処理を続行
        guard let s = textField.text, !s.isEmpty else { return }
        
        // 末尾に改行文字を追加
        let line = s + "\n"

        // TODO: ファイルに保存できるのはData型のため、文字列から変換


        
        // TODO: ファイルが存在していれば追記、存在しなければ作成して書き込み



    }
    
    @IBAction func loadButtonTapped(_ sender: UIButton) {
        // TODO: ファイルが存在していれば、ファイルからデータを読み込む



    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
