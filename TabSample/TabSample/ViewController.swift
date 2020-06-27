//
//  ViewController.swift
//  TabSample
//
//  Created by 佐藤遼平 on 2020/06/26.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        tabBarItem.badgeValue = String(Int(sender.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

