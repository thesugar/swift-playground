//
//  ViewController.swift
//  TextInputSample
//
//  Created by 佐藤遼平 on 2020/06/24.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBAction func showButtonTapped(_ sender: UIButton) {
        // テキストフィールドの入力値を取得
        let textInput = textField.text!
        // 取得した入力値を、ラベルのtextプロパティへ設定
        label.text = textInput
        // テキストフィールドの入力値をクリア
        textField.text = ""
        // 入力を終了する（ソフトウェアキーボードを隠す）
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.placeholder = "文字列を入力してね"
    }


}

