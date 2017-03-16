//
//  HomeViewController.swift
//  UIPageViewController Post
//
//  Created by Huy LX on 3/12/17.
//  Copyright © 2017 Seven Even. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView : UIWebView!
    @IBOutlet weak var progressBar : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL (string: "http://wmi.learnflux.net/mobile/");//http://inkstudiowp.16mb.com/wmi/mobile/

        let requestObj = NSURLRequest(url: url! as URL);
        webView.delegate = self
        webView.loadRequest(requestObj as URLRequest);
        progressBar.image = UIImage.gifImageWithName("loading_")
    
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        progressBar.isHidden = false
        
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        progressBar.isHidden = true
    }
    
}
