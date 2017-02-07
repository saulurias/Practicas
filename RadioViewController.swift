//
//  RadioViewController.swift
//  Guaymas 6.0
//
//  Created by saul ulises urias guzmàn on 22/01/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit

class RadioViewController: UIViewController {
    
    //MARK: IBOulets
    @IBOutlet weak var webView: UIWebView!
    
    //Variables
    let urlValue = "http://mixlr.com/guaymas/";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL (string: urlValue){
            let requestObj = URLRequest(url: url)
            _ = webView.loadRequest(requestObj)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
