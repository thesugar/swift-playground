//
//  DetailViewController.swift
//  SimpleTableSample
//
//  Created by 佐藤遼平 on 2020/06/29.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // 表示する画像名の受け取り用
    var imageName: String = ""
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 画像を表示
        imageView.image = UIImage(named: imageName)
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
