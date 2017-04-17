//
//  VideosViewController.swift
//  UIPageViewController Post
//
//  Created by Huy LX on 3/12/17.
//  Copyright © 2017 Seven Even. All rights reserved.
//

import UIKit
import YouTubePlayer


class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var itemTitle : UILabel!
    @IBOutlet weak var itemDes: UILabel!
    @IBOutlet weak var itemImage : UIImageView!
}

class VideosViewController: UIViewController, UIWebViewDelegate {

    
//    @IBOutlet weak var webView : UIWebView!
//    @IBOutlet weak var progressBar : UIImageView!
    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var playerView: YouTubePlayerView!
    @IBOutlet weak var videos : UITableView!
    @IBOutlet weak var videoTitle : UITextView!
    @IBOutlet weak var videoDescription : UITextView!
    @IBOutlet weak var videoDuration : UILabel!
    @IBOutlet weak var viewVideoTableView : UIView!
    @IBOutlet weak var btnShareThis :UIButton!
    @IBOutlet weak var viewVideoActived : UIView!
    
    var video1 : VideoModel!
    var video2 : VideoModel!
    var video3 : VideoModel!
    var video4 : VideoModel!
    var video5 : VideoModel!
    
    var lstOtherVideoNextComing : [VideoModel]!
    
    var lstOtherVideoNextComingActived : [VideoModel]!
    var videoActived : VideoModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVideoData()
        initLayout()
//        popularUI()
        initPlayer()
//        let url = NSURL (string: "http://finedu.wmi.com.sg/video/");
//        let requestObj = NSURLRequest(url: url! as URL);
//        webView.delegate = self
//        webView.loadRequest(requestObj as URLRequest);
//        progressBar.image = UIImage.gifImageWithName("loading")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        popularUI()
    }
    
    func initLayout()
    {
        videos.delegate = self
        videos.dataSource = self
    }
    
    func initPlayer() {
        playerView.playerVars = [
            "playsinline": "1" as AnyObject,
            "controls": "1" as AnyObject,
            "showinfo": "1" as AnyObject
        ]
    }
    
    func adjustUITextViewHeight(textView : UITextView)
    {
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width:fixedWidth, height: newSize.height)
        textView.frame = newFrame;
    }
    
    func setLinkId(id : String!)
    {
        playerView.loadVideoID(id)
    }
    
    func initVideoData()
    {
        video1 = VideoModel()
        video1.index = 0
        video1.image = "Home_1"
        video1.title = "Understanding Risk and Return"
        video1.shortDescription = "In this video, we look at the fundamental principles underlying..."
        video1.fullDescription = "In this video, we look at the fundamental principles underlying the relation between risk and return in investment. Understanding how they work and your tolerance to risk can help you make investment decisions that best meet your financial needs and goals!"
        video1.linkFull = "https://www.youtube.com/watch?v=4KGvoy_Ke9Y"
        video1.linkId = "4KGvoy_Ke9Y"
        video1.duration = "5 min watch"
        
        video2 = VideoModel()
        video2.index = 1
        video2.image = "Home_2"
        video2.title = "Portfolio Diversification"
        video2.shortDescription = "What are the benefits of portfolio diversification? Find out from..."
        video2.fullDescription = "What are the benefits of portfolio diversification? Find out from this video how portfolio diversification can work to reduce risk for the same level of returns"
        video2.linkFull = "https://www.youtube.com/watch?v=3jTyZl25Llo"
        video2.linkId = "3jTyZl25Llo"
        video2.duration = "5 min watch"
        
        video3 = VideoModel()
        video3.index = 2
        video3.image = "Home_3"
        video3.title = "What Are Bonds?"
        video3.shortDescription = "This video offers an essential coverage on the fundamentals of..."
        video3.fullDescription = "This video offers an essential coverage on the fundamentals of bonds and provides foundational knowledge of bond investments to a new investor."
        video3.linkFull = "https://www.youtube.com/watch?v=h8fe7P0X3sA"
        video3.linkId = "5xBg18TMiLs"
        video3.duration = "4 min watch"
        
        video4 = VideoModel()
        video4.index = 3
        video4.image = "Home_4"
        video4.title = "Key Risks In Bond Investment"
        video4.shortDescription = "It is important for investors to be aware of risks..."
        video4.fullDescription = "It is important for investors to be aware of risks in any form of investments. This video will introduce you to key risks in bond investments."
        video4.linkFull = "https://www.youtube.com/watch?v=GIfJ2xmoHJI"
        video4.linkId = "GIfJ2xmoHJI"
        video4.duration = "5 min watch"
        
        video5 = VideoModel()
        video5.index = 4
        video5.image = "Home_5"
        video5.title = "Bond Markets"
        video5.shortDescription = "Where are the bond markets? This video provides a simple..."
        video5.fullDescription = "Where are the bond markets? This video provides a simple guide on how to purchase bonds."
        video5.linkFull = "https://www.youtube.com/watch?v=5xBg18TMiLs"
        video5.linkId = "5xBg18TMiLs"
        video5.duration = "3 min watch"
        
        lstOtherVideoNextComing = [video1, video2, video3, video4, video5]
        lstOtherVideoNextComingActived = lstOtherVideoNextComing
        videoActived = lstOtherVideoNextComingActived.remove(at: 0)
        
    }
    
    func popularUI()
    {
        videoTitle.text = videoActived.title
        videoDescription.text = videoActived.fullDescription
        videoDuration.text = videoActived.duration
        videoTitle.font = CommonUtils.sharedInstance.updateTextFont(textView: videoTitle, fontMinSize: 14)
        videoDescription.font = CommonUtils.sharedInstance.updateTextFont(textView: videoDescription, fontMinSize: 12)
        adjustUITextViewHeight(textView: videoTitle)
        adjustUITextViewHeight(textView: videoDescription)
        viewVideoActived.frame = CGRect(x:viewVideoActived.frame.origin.x, y:viewVideoActived.frame.origin.y, width: viewVideoActived.frame.width, height:videoDescription.frame.origin.y + videoDescription.frame.height)
        btnShareThis.frame = CGRect(x:btnShareThis.frame.origin.x, y:viewVideoActived.frame.origin.y + viewVideoActived.frame.height, width:btnShareThis.frame.width, height:btnShareThis.frame.height)
        setLinkId(id: videoActived.linkId)
        viewVideoTableView.frame = CGRect(x:viewVideoTableView.frame.origin.x,y:btnShareThis.frame.origin.y + btnShareThis.frame.height,width:viewVideoTableView.frame.width, height:365)
        
        scrollView.contentSize.height = viewVideoTableView.frame.origin.y + viewVideoTableView.frame.height
    }
//    func webViewDidStartLoad(_ webView: UIWebView) {
//        progressBar.isHidden = false
//        
//    }
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        progressBar.isHidden = true
//    }
}

extension VideosViewController {
    @IBAction func sendThisClicked(_sender : AnyObject){
        let text = videoActived.linkFull
        
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        activityViewController.excludedActivityTypes = [ UIActivityType.print, UIActivityType.copyToPasteboard, UIActivityType.assignToContact, UIActivityType.saveToCameraRoll]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
}

extension VideosViewController: UITableViewDelegate
{
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        switch indexPath.row {
        case 0:
            videoActived = lstOtherVideoNextComingActived[0]
            lstOtherVideoNextComingActived = lstOtherVideoNextComing
            lstOtherVideoNextComingActived.remove(at: videoActived.index)
            break;
        case 1:
            videoActived = lstOtherVideoNextComingActived[1]
            lstOtherVideoNextComingActived = lstOtherVideoNextComing
            lstOtherVideoNextComingActived.remove(at: videoActived.index)
            break;
        case 2:
            videoActived = lstOtherVideoNextComingActived[2]
            lstOtherVideoNextComingActived = lstOtherVideoNextComing
            lstOtherVideoNextComingActived.remove(at: videoActived.index)
            break;
        case 3:
            videoActived = lstOtherVideoNextComingActived[3]
            lstOtherVideoNextComingActived = lstOtherVideoNextComing
            lstOtherVideoNextComingActived.remove(at: videoActived.index)
            break;
        default:
            videoActived = lstOtherVideoNextComingActived[0]
            lstOtherVideoNextComingActived = lstOtherVideoNextComing
            lstOtherVideoNextComingActived.remove(at: videoActived.index)
        }
        popularUI()
        tableView.reloadData()
    }
}

extension VideosViewController : UITableViewDataSource
{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : VideoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
        
        let item : VideoModel = lstOtherVideoNextComingActived[indexPath.row]
        cell.itemTitle?.text = item.title
        cell.itemDes?.text = item.fullDescription
        cell.itemImage?.image = UIImage(named: item.image)
//        cell.itemDes.font = CommonUtils.sharedInstance.updateTextFont(textView: cell.itemDes, fontMinSize: 10)
        
        return cell
    }
}
