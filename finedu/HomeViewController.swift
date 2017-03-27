//
//  HomeViewController.swift
//  UIPageViewController Post
//
//  Created by Huy LX on 3/12/17.
//  Copyright © 2017 Seven Even. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    /*@IBOutlet weak var webView : UIWebView!
    @IBOutlet weak var progressBar : UIImageView!*/
    @IBOutlet weak var view1 : UIView!
    @IBOutlet weak var view2 : UIView!
    @IBOutlet weak var view3 : UIView!
    @IBOutlet weak var view4 : UIView!
    @IBOutlet weak var view5 : UIView!
    
    @IBOutlet weak var scrollview : UIScrollView!
    
    @IBOutlet weak var textTitle1 : UITextView!
    @IBOutlet weak var textContent1 : UITextView!
    @IBOutlet weak var textTitle2 : UITextView!
    @IBOutlet weak var textContent2 : UITextView!
    @IBOutlet weak var textTitle3 : UITextView!
    @IBOutlet weak var textContent3 : UITextView!
    @IBOutlet weak var textTitle4 : UITextView!
    @IBOutlet weak var textContent4 : UITextView!
    @IBOutlet weak var textTitle5 : UITextView!
    @IBOutlet weak var textContent5 : UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textTitle1.font = updateTextFont(textView: textTitle1);
        textContent1.font = updateTextFont(textView: textContent1);
        textTitle2.font = updateTextFont(textView: textTitle2);
        textContent2.font = updateTextFont(textView: textContent2);
        textTitle3.font = updateTextFont(textView: textTitle3);
        textContent3.font = updateTextFont(textView: textContent3);
        textTitle4.font = updateTextFont(textView: textTitle4);
        textContent4.font = updateTextFont(textView: textContent4);
        textTitle5.font = updateTextFont(textView: textTitle5);
        textContent5.font = updateTextFont(textView: textContent5);
        
        adjustView();
        scrollview.contentSize.height = view5.frame.height + view5.frame.origin.y + 24;
        
//        
//        let url = NSURL (string: "http://finedu.wmi.com.sg/mobile/");
//
//        let requestObj = NSURLRequest(url: url! as URL);
//        webView.delegate = self
//        webView.loadRequest(requestObj as URLRequest);
//        progressBar.image = UIImage.gifImageWithName("loading")
    
    }
    
    /*func webViewDidStartLoad(_ webView: UIWebView) {
        progressBar.isHidden = false
        
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        progressBar.isHidden = true
    }*/
    
    func updateTextFont(textView : UITextView) -> UIFont {
        var fontSize = textView.font?.pointSize;
        let minSize : CGFloat = 12;
        var size : CGSize = textView.sizeThatFits(CGSize(width: textView.frame.width, height: 10000));
        while (fontSize! > minSize &&  size.height >= textView.frame.size.height ) {
            fontSize = fontSize! - 1.0;
            textView.font = UIFont(name: (textView.font?.fontName)!, size: fontSize!)
            size = textView.sizeThatFits(CGSize(width: textView.frame.width, height: 10000));
        }
        return textView.font!;
    }
    
    func adjustView() {
        
        view1.frame = CGRect(x:view1.frame.origin.x, y: view1.frame.origin.y, width: view1.frame.width, height:textContent1.frame.height + textContent1.frame.origin.y);
        view2.frame = CGRect(x:view2.frame.origin.x, y: view2.frame.origin.y, width: view2.frame.width, height:textContent2.frame.height + textContent2.frame.origin.y);
        view3.frame = CGRect(x:view3.frame.origin.x, y: view3.frame.origin.y, width: view3.frame.width, height:textContent3.frame.height + textContent3.frame.origin.y);
        view4.frame = CGRect(x:view4.frame.origin.x, y: view4.frame.origin.y, width: view4.frame.width, height:textContent4.frame.height + textContent4.frame.origin.y);
        view5.frame = CGRect(x:view5.frame.origin.x, y: view5.frame.origin.y, width: view5.frame.width, height:textContent5.frame.height + textContent5.frame.origin.y);
        let frmView1 = view1.frame;
        view2.frame.origin.y = frmView1.size.height + frmView1.origin.y;
        let frmView2 = view2.frame;
        view3.frame.origin.y = frmView2.size.height + frmView2.origin.y;
        let frmView3 = view3.frame;
        view4.frame.origin.y = frmView3.size.height + frmView3.origin.y;
        let frmView4 = view4.frame;
        view5.frame.origin.y = frmView4.size.height + frmView4.origin.y;
    }
}
