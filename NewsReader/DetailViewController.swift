//
//  DetailViewController.swift
//  NewsReader
//
//  Created by 佐藤遼平 on 2020/06/08.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController : UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var link: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: self.link) {
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
}
