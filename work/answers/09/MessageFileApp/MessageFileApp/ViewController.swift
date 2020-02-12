import UIKit

class ViewController: UIViewController {
    // TODO: ファイルのパス
    let filePath: String = {
        // ユーザのDocumentディレクトリのパスに、ファイル名を連結
        let manager = FileManager.default
        let urls = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let directoryURL: URL = urls[0]
        let fileURL = directoryURL.appendingPathComponent("myFile.txt")

        print(fileURL.path)

        return fileURL.path
    } ()

    // TODO: ファイルの存在有無
    var existsFile: Bool {
        let manager = FileManager.default
        return manager.fileExists(atPath: filePath)
    }

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
        let data: Data = line.data(using: .utf8)!

        // TODO: ファイルの存在有無により追記または新規作成
        if existsFile {
            let handle = FileHandle(forWritingAtPath: filePath)!

            defer {
                handle.closeFile()
            }

            // 末尾に追記
            handle.seekToEndOfFile()
            handle.write(data)
        } else {
            // 内容を指定して新規作成
            let manager = FileManager.default
            manager.createFile(atPath: filePath, contents: data, attributes: nil)
        }
    }

    @IBAction func showButtonTapped(_ sender: UIButton) {
        // TODO: ファイルが存在している場合のみ読み込み
        if existsFile {
            let handle = FileHandle(forReadingAtPath: filePath)!

            defer {
                handle.closeFile()
            }

            // 全データを読み込み、文字列に変換
            let data: Data = handle.readDataToEndOfFile()
            let lines: String? = String(data: data, encoding: .utf8)

            // 改行で区切った配列に分割 -> 空文字列を除外 -> 配列を逆順 -> 結合
            let messages = lines?.components(separatedBy: "\n")
            let nonEmptyMessages = messages?.filter({ (message) -> Bool in
                !message.isEmpty
            })
            let reversedMessages = nonEmptyMessages?.reversed()
            let result = reversedMessages?.joined(separator: "\n")

            textView.text = result
        } else {
            textView.text = "保存されていません。"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
