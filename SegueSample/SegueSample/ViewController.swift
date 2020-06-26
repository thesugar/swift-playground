//
//  ViewController.swift
//  SegueSample
//
//  Created by 佐藤遼平 on 2020/06/26.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        print("Returned")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
         `guard` 文は、条件に合致しない場合に早い段階で処理を抜けるための構文であり、`else` 節が必須。
         ここでは `guard-let` 文として利用し、
         `Optional` の内容が取得できた（`nil`ではなかった）場合のみ後続の処理を実行するようにする。
         
         `guard-let` 文と `if-let` 文の大きな違いは、`guard-let` では let で束縛した値を以降の処理で
         利用できるという点。if-let 文では束縛した値は直後のブロック内でのみ有効。
         */
        
        // 遷移先のビューコントローラーを取得
        guard let dest = segue.destination as? SecondViewController else {
            return
        }
        
        // タップされたボタンを取得
        guard let button = sender as? UIButton else {
            return
        }
        
        // タップされたボタンの tag プロパティの値を、遷移先ビューコントローラーのプロパティへ代入
        dest.imageIndex = button.tag
    }

}

