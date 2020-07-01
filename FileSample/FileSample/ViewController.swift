//
//  ViewController.swift
//  FileSample
//
//  Created by 佐藤遼平 on 2020/07/01.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     ----- ファイルのパスを取得し、プロパティとして保持 -----
     ✅ iOS アプリでユーザがファイルを保存する先はデータコンテナの Documents ディレクトリ。
     ✅ この Documents ディレクトリ内に、任意のファイルを作成して利用できる。
     ✅ そのため、この Documents ディレクトリを最初に検索する必要がある。
     ✅ ファイルアクセスの中心となるのが、FileManager オブジェクト。FileManager オブジェクトは、FileManager.defaults で取得できる。
     ✅ ディレクトリは URL として検索し、その検索結果から取り出す。①
     */
    let filePath: String = {
        // FileManager オブジェクトを取得
        let manager = FileManager.default
        
        // ① ユーザー用の領域から、Document ディレクトリを検索
        // manager.urls の戻り値（`urls` 変数の中身）は配列
        let urls = manager.urls(for: .documentDirectory, in: .userDomainMask)
        
        // 検索結果の最初のディレクトリを取得し、ファイル名を追加
        let directoryURL: URL = urls[0]
        let fileURL = directoryURL.appendingPathComponent("myFile") // 戻り値を返さない `.appendPathComponent()` というメソッドもあるので注意
        
        // ファイルのパスをコンソールに表示（デバッグ用。リリース時には削除）
        print(fileURL.path)
        
        // ファイルのパスを文字列として返す
        return fileURL.path
    }() // ファイルのパスの取得処理をクロージャとして用意（`{}`の中）し、プロパティの初回評価時に実行（`()`）して値を保持するようにしている。

    // ファイルの存在有無をチェック
    // 以下は Computed Property（計算型プロパティ）という記法
    // Computed Property: 決まった値を保持しておらず、インスタンスが生成される度に別プロパティから計算されて値を取得する。
    var existsFile: Bool {
        // FileManager オブジェクトを取得、指定したファイルの存在確認
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
        
        // ファイルに保存できるのは Data 型であるため、文字列から変換
        let data = line.data(using: .utf8)! // (文字列).data は文字列を Data オブジェクトに変換するメソッド。
        
        // ファイルが存在していれば追記、存在しなければ作成して書き込み
        if existsFile {
            // ファイル操作用の FileHandle（書き込みモード）を取得（forWritingAtPath, 引数で初期化することで、書き込み専用のインスタンスを返す）
            // forReadingAtPath（読み取り専用インスタンスを返す）、forUpdatingAtPath（読み書き可能なインスタンスを返す）もある。
            let handle = FileHandle(forWritingAtPath: filePath)!
            
            // このブロックを抜ける際に、ファイルを閉じる
            // ファイルのクローズなど、後処理として必須なものは defer ブロックを利用するとよい。
            // defer ブロックに記述した内容は、その外側のブロックを抜けるタイミングで実行される。
            // defer ブロックが複数ある場合は、**後ろに書いたものから** 順に実行される。
            defer {
                handle.closeFile()
            }
            
            // ファイル末尾まで操作位置を移動し、内容を追記する
            handle.seekToEndOfFile()
            handle.write(data)
        } else {
            // FileManager オブジェクトを取得し、ファイルを作成
            let manager = FileManager.default
            manager.createFile(atPath: filePath, contents: data, attributes: nil)
        }
    }
    
    @IBAction func loadButtonTapped(_ sender: UIButton) {
        // ファイルが存在していれば、ファイルからデータを読み込む
        if existsFile {
            // ファイル操作用の FileHandle（読み込みモード）を取得
            let handle = FileHandle(forReadingAtPath: filePath)!
            
            // このブロックを抜ける際に、ファイルを閉じる
            defer {
                handle.closeFile()
            }
            
            // ファイルの全データを読み込む
            let data: Data = handle.readDataToEndOfFile()
            
            // 読み込んだ Data を文字列に変換
            let lines = String(data: data, encoding: .utf8)
            
            // 読み込んだ文字列をテキストビューに表示
            textView.text = lines
        } else {
            textView.text = "データがありません。😱"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

