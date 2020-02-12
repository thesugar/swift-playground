import UIKit

class ViewController: UIViewController {
    /// ファイルのパス
    let filePath: String = {
        // FileManagerオブジェクトを取得
        let manager = FileManager.default
        
        // ユーザ用の領域から、Documentディレクトリを検索
        let urls = manager.urls(for: .documentDirectory, in: .userDomainMask)
        
        // 検索結果の最初のディレクトリを取得し、ファイル名を追加
        let directoryURL: URL = urls[0]
        let fileURL = directoryURL.appendingPathComponent("myFile.txt")
        
        // リリース時には削除
        // デバッグ用に、ファイルのパスをコンソールに表示
        print(fileURL.path)
        
        // ファイルのパスを文字列として返す
        return fileURL.path
    } ()
    
    /// ファイルの存在有無（Computedプロパティとして保持し、アクセスされるたびにチェック）
    var existsFile: Bool {
        // FileManagerオブジェクトを取得、指定したファイルの存在確認（trueなら存在）
        let manager = FileManager.default
        return manager.fileExists(atPath: filePath)
    }
    
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

        // ファイルに保存できるのはData型のため、文字列から変換
        let data: Data = line.data(using: .utf8)!
        
        // ファイルが存在していれば追記、存在しなければ作成して書き込み
        if existsFile {
            // ファイル操作用のFileHandle（書き込みモード）を取得
            let handle = FileHandle(forWritingAtPath: filePath)!
            
            // このブロックを抜ける際に、ファイルを閉じる
            defer {
                handle.closeFile()
            }
            
            // ファイル末尾まで操作位置を移動し、内容を追記する
            handle.seekToEndOfFile()
            handle.write(data)
        } else {
            // FileManagerオブジェクトを取得し、ファイルを作成
            let manager = FileManager.default
            manager.createFile(atPath: filePath, contents: data, attributes: nil)
        }
    }
    
    @IBAction func loadButtonTapped(_ sender: UIButton) {
        // ファイルが存在していれば、ファイルからデータを読み込む
        if existsFile {
            // ファイル操作用のFileHandle（読み込みモード）を取得
            let handle = FileHandle(forReadingAtPath: filePath)!
            
            // このブロックを抜ける際に、ファイルを閉じる
            defer {
                handle.closeFile()
            }
            
            // ファイルの全データを読み込む
            let data: Data = handle.readDataToEndOfFile()
            
            // 読み込んだDataを文字列に変換
            let lines: String? = String(data: data, encoding: .utf8)
            
            // 読み込んだ文字列をテキストビューに表示
            textView.text = lines
        } else {
            textView.text = "データがありません。"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
