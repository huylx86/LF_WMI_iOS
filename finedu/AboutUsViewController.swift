//
//  ContactUs.swift
//  UIPageViewController Post
//
//  Created by Huy LX on 3/12/17.
//  Copyright © 2017 Seven Even. All rights reserved.
//

import UIKit


class AboutUsViewController: UIViewController {
    
    /*@IBOutlet weak var webView : UIWebView!
    @IBOutlet weak var progressBar : UIImageView!*/
    @IBOutlet weak var text1 : UITextView!
    @IBOutlet weak var text2 : UITextView!
    @IBOutlet weak var btnLearnMode : UILabel!
    @IBOutlet weak var imgLogo : UIImageView!
    
    let images = [
        UIImage(named: "nanyang")!,
        UIImage(named: "deloitte")!,
        UIImage(named: "sias")]
    var index = 0
    var currentIndex = 0
    let animationDuration: TimeInterval = 0.25
    let switchingInterval: TimeInterval = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLearnMode.layer.borderWidth = 4
        btnLearnMode.layer.cornerRadius = 5
        btnLearnMode.layer.borderColor = UIColor(red:203/255.0, green:178/255.0, blue:52/255.0, alpha: 1.0).cgColor
        
        
        text1.font = updateTextFont(textView: text1);
        text2.font = updateTextFont(textView: text2);
        
        index += 1;
        currentIndex = index
        imgLogo.image = images[index];
        animateImageView();
        
        let guestureLearnMode = UITapGestureRecognizer(target: self, action: #selector(self.learnMoreClick(_:)));
        btnLearnMode.addGestureRecognizer(guestureLearnMode)
        
        let guestureLogo = UITapGestureRecognizer(target: self, action: #selector(self.logoClick(_:)));
        imgLogo.addGestureRecognizer(guestureLogo)
        
        /*let url = NSURL (string: "http://finedu.wmi.com.sg/credits/");
        let requestObj = NSURLRequest(url: url! as URL);
        webView.delegate = self
        webView.loadRequest(requestObj as URLRequest);
        progressBar.image = UIImage.gifImageWithName("loading")*/
        
    }
    
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
    
    func animateImageView() {
        CATransaction.begin()
        
        CATransaction.setAnimationDuration(animationDuration)
        CATransaction.setCompletionBlock {
            let delay = DispatchTime.now() + self.switchingInterval;
            DispatchQueue.main.asyncAfter(deadline:delay) {
                self.animateImageView()
            }
        }
    
        let transition = CATransition()
//        transition.type = kCATransitionFade
        
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        
        imgLogo.layer.add(transition, forKey: nil)
        imgLogo.image = images[index]
        currentIndex = index
        CATransaction.commit()
        
        index = index < images.count - 1 ? index + 1 : 0
    }
    
    func learnMoreClick(_ sender : UITapGestureRecognizer)
    {
        let url = NSURL(string: "http://www.wmi.com.sg")!
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    func logoClick(_ sender : UITapGestureRecognizer)
    {
        var strUrl = ""
        switch(currentIndex){
        case 0 :
            strUrl = "http://www.ntu.edu.sg/Pages/home.aspx"
            break;
        case 1:
            strUrl = "https://www2.deloitte.com/sg/en.html"
            break;
        case 2:
            strUrl = "https://sias.org.sg/"
            break;
        default:
            strUrl = "https://sias.org.sg/"
            break;
        }
        
        let url = NSURL(string: strUrl)
        UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
    }
    
    /*func webViewDidStartLoad(_ webView: UIWebView) {
        progressBar.isHidden = false
        
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        progressBar.isHidden = true
    }*/
}
