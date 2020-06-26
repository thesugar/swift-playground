//
//  ViewController.swift
//  BranchSegueSample
//
//  Created by 佐藤遼平 on 2020/06/26.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBAction func showButtonTapped(_ sender: UIButton) {
        let identifier: String
        
        // selectedSegmentIndex は選択されたセグメントの番号（0 始まり）
        if segment.selectedSegmentIndex == 0 {
            identifier = "venetia"
        } else {
            identifier = "firenze"
        }
        
        // Segue の identifier プロパティを指定して、画面遷移
        /*
         💥 画面遷移のトリガーとするボタンタップのアクション内などに画面遷移のコードを記述する。
         💥 performSegue(withIdentifier:sender:)メソッドの第一引数に対象セグエのidentifierを指定することで
         　　画面遷移を行う。このメソッドは、ビューコントローラーが持っている。
         */
        performSegue(withIdentifier: identifier, sender: nil)
    }
    
    @IBAction func unwindToTop(_ unwindSegue: UIStoryboardSegue) {
        print("Returned")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

