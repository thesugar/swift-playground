//
//  SecondViewController.swift
//  SegueSample
//
//  Created by 佐藤遼平 on 2020/06/26.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // 表示するデータの番号を受け取るためのプロパティ
    var imageIndex: Int?
    
    // 表示するデータの一覧
    let images: [(fileName: String, description: String)] = [
        ("IMG_6123", "2020/2/16 ヴェネツィア\nリアルト橋です。さすが水の都といった感じでした。"),
        ("IMG_6908", "2020/2/19 フィレンツェ\nドゥオモに向かう道。フィレンツェは趣のある街でした。"),
    ]

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 前画面から渡されたデータの番号をもとに、画像と説明を表示
        let imageData = images[imageIndex ?? 0]
        imageView.image = UIImage(named: imageData.fileName)
        textView.text = imageData.description
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
