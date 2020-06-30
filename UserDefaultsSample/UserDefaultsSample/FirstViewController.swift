//
//  FirstViewController.swift
//  UserDefaultsSample
//
//  Created by 佐藤遼平 on 2020/06/30.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // 利用する背景色用の列挙型を定義
    enum WallpaperColor: Int {
        case whiteColor = 0
        case grayColor, brownColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // 画面が表示される直前のタイミングに毎回呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // UserDefaults オブジェクトを取得
        let defaults = UserDefaults.standard
        
        // UserDefaults に格納された値を取得
        let selectedIndex = defaults.integer(forKey: "colorIndex")
        
        // 取得した値をもとに列挙型を作成し、対応する値がある場合のみ処理を続行
        guard let color = WallpaperColor(rawValue: selectedIndex) else { return }
        
        // 背景色に設定するための UIColor
        let selectedColor: UIColor
        
        // 取得した値をもとに、ビューの背景色を設定
        switch color {
        case .whiteColor:
            selectedColor = .white
        case .grayColor:
            selectedColor = .gray
        case .brownColor:
            selectedColor = .brown
        }
        
        // 背景色を設定
        self.view.backgroundColor = selectedColor
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
