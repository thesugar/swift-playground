//
//  ViewController.swift
//  PickerSample
//
//  Created by 佐藤遼平 on 2020/06/25.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    // 画像の表示名とファイル名を持った、タプルの配列
    let imageNames: [(title: String, fileName: String)] = [
        ("ストロイエ", "IMG_2931"),
        ("海沿いのコペンハーゲン", "IMG_2975"),
        ("ガムラスタンの広場", "IMG_3438"),
        ("ストックホルム中央駅", "IMG_3735"),
        ("オスロの港", "IMG_4394"),
        ("オスロの広場", "IMG_4484"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // pickerView の dataSource と delegate にビューコントローラー自身を指定
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    // MARK: - Picker view dataSource
    
    // 以下 2 つのメソッドは、プロトコルに準拠した時点で絶対に実装しないといけないので、
    // 補完機能にしたがえば自然に書くことになる（自分でこれを実装する、と発想しなくてよい）
    
    // pickerView の一行に表示する列数を返す
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 今回は一列のみ表示
        return 1
    }
    
    // pickerView に表示する行数を返す
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 配列の要素数分だけ表示
        return imageNames.count
    }
    
    // MARK: - Picker view delegate
    
    // 以下のメソッドの実装は必須ではないが、上記までの実装が完了した時点でアプリを実行すると
    // ピッカービューの文字列が「？」になっており文字列を決めてあげないといけないことがわかるし
    // 画像の選択もできないので、画像の選択ができるような実装をしないといけないこともわかるはず
    
    // pickerView の各行を表示するタイミングで、表示する内容を文字列として返す
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageNames[row].title
    }
    
    // pickerView の行が選択されたタイミングの処理
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // row には行番号が渡されるので、配列の row 番目のタプルの fileName を取得して処理
        imageView.image = UIImage(named: imageNames[row].fileName)
    }

}

