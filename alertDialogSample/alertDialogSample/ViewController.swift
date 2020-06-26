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
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        let resultMessage: String
        
        if let number1 = Int(textField1.text!), let number2 = Int(textField2.text!) {
            let result = number1 + number2
            resultMessage = "\(number1) + \(number2) = \(result)"
        } else {
            resultMessage = "整数を入力してください。"
        }
        
        // アラートダイアログを作成
        let alert = UIAlertController(title: "計算結果", message: resultMessage , preferredStyle: .alert)
        
        // OK ボタンを作成、クリックされたら現在の入力値をクリアするように handler に指定
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            self.textField1.text = ""
            self.textField2.text = ""
            self.view.endEditing(true)
        }
        
        // アラートダイアログに OK ボタンを追加
        alert.addAction(okAction)
        
        // アラートダイアログを表示
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

