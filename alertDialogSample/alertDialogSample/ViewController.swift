//
//  ViewController.swift
//  alertDialogSample
//
//  Created by 佐藤遼平 on 2020/06/26.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        // メソッドを抜ける際に、入力値をクリアして編集状態を終了する
        // （`defer` は後処理を記述するための構文。`defer` ブロックの内容は、外側のブロックを抜ける直前に実行される）
        defer {
            textField1.text = ""
            textField2.text = ""
            view.endEditing(true)
        }
        // 正しく整数が入力された場合のみ、計算してテキストビューに結果を表示
        if let number1 = Int(textField1.text!), let number2 = Int(textField2.text!) {
            let result = number1 + number2
            let expression: String = "\(number1) + \(number2) = \(result)\n"
            
            // テキストビューに、計算結果の文字列を追記
            textView.text = textView.text + expression
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        // アクションシートを作成
        let sheet = UIAlertController(title: "計算履歴削除確認", message: "本当に削除しますか？", preferredStyle: .actionSheet)
        
        // 削除ボタンを作成
        let removeAction = UIAlertAction(title: "削除実行", style: .destructive) { action in
            self.textView.text = ""
        }
        
        // キャンセルボタンを作成（iPad では表示されない）
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        
        // 作成したボタンをアクションシートに追加
        sheet.addAction(removeAction)
        sheet.addAction(cancelAction)
        
        // アクションシートを表示
        present(sheet, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

