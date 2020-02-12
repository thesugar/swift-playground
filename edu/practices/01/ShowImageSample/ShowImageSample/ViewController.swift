//
//  ViewController.swift
//  ShowImageSample
//
//  Created by User on 2020/02/12.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var teaImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teaImageView.image = UIImage(named: "tea_cup")
    }


}

