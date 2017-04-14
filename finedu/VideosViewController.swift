//
//  VideosViewController.swift
//  UIPageViewController Post
//
//  Created by Huy LX on 3/12/17.
//  Copyright © 2017 Seven Even. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideosViewController: UIViewController, UIWebViewDelegate {
    
//    @IBOutlet weak var webView : UIWebView!
//    @IBOutlet weak var progressBar : UIImageView!
    @IBOutlet var playerView: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPlayer()
//        let url = NSURL (string: "http://finedu.wmi.com.sg/video/");
//        let requestObj = NSURLRequest(url: url! as URL);
//        webView.delegate = self
//        webView.loadRequest(requestObj as URLRequest);
//        progressBar.image = UIImage.gifImageWithName("loading")
    }
    
    func initPlayer() {
        playerView.playerVars = [
            "playsinline": "1" as AnyObject,
            "controls": "1" as AnyObject,
            "showinfo": "1" as AnyObject
        ]
        playerView.loadVideoID("5xBg18TMiLs")
    }
//    func webViewDidStartLoad(_ webView: UIWebView) {
//        progressBar.isHidden = false
//        
//    }
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        progressBar.isHidden = true
//    }
}
