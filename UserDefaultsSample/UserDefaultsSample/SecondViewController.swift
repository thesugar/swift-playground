//
//  SecondViewController.swift
//  UserDefaultsSample
//
//  Created by 佐藤遼平 on 2020/06/30.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        // セグメントの選択値を取得
        let selectedIndex = sender.selectedSegmentIndex
        
        // UserDefaults オブジェクトを取得
        let defaults = UserDefaults.standard
        
        // UserDefaults に、セグメントの選択値を保存
        defaults.set(selectedIndex, forKey: "colorIndex")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画面表示時にあらかじめ、保存済みの値をもとにセグメントの項目を選択
        let defaults = UserDefaults.standard
        let colorIndex = defaults.integer(forKey: "colorIndex")
        segment.selectedSegmentIndex = colorIndex
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
