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

}

