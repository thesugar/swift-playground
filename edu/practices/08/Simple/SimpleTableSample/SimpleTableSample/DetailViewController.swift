//
//  DetailViewController.swift
//  SimpleTableSample
//
//  Created by User on 2020/02/13.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // 表示する画像名を前の画面から受け取るための変数
    var imageName: String = ""
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
