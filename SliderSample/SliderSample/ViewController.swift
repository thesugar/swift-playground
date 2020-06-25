//
//  ViewController.swift
//  SliderSample
//
//  Created by 佐藤遼平 on 2020/06/25.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    // viewDidLoad 内で（＝起動時に）スライダーの値を読み取る必要があるため
    // アクション接続のみならずアウトレット接続も必要。
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        // スライダーの現在値から CGFloat を作成し、イメージビューの alpha プロパティに設定
        // UISlider の value は Float 型だが、UIImageView の alpha プロパティは
        // CGFloat 型であるため、Float 型から CGFloat 型へ変換している。
        imageView.alpha = CGFloat(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // スライダーの現在値から CGFloat を作成し、イメージビューの alpha プロパティに設定
        imageView.alpha = CGFloat(slider.value)
    }
    
    // 画面のレイアウトが更新された「直後」のタイミングに毎回呼ばれる。
    // ビューの座標は viewDidLoad() の時点では確定せず、レイアウトが更新された後のタイミングで確定するため、viewDidLayoutSubviews() を使う。
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // イメージビューの center プロパティを取得し、ラベルに表示
        label.text = "(\(imageView.center.x), \(imageView.center.y))"
    }
}

