
import UIKit
import MessageUI

class FinEduViewController: UIViewController {

    //@IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var btnHome : UIButton!
    @IBOutlet weak var btnVideos : UIButton!
    @IBOutlet weak var btnAboutUs : UIButton!
    @IBOutlet weak var vIndicatorHome : UIView!
    @IBOutlet weak var vIndicatorVideos : UIView!
    @IBOutlet weak var vIndicatorAboutUs : UIView!
    
    @IBOutlet weak var btnFacebookView : UIButton!
    @IBOutlet weak var vFacebookView : UIView!
    
    @IBOutlet weak var vFacebookViewDetail : UIView!
    @IBOutlet weak var btnFacebookIcon : UIButton!
    @IBOutlet weak var btnFacebookText : UIButton!
    
    @IBOutlet weak var btnContactUsView : UIButton!
    @IBOutlet weak var vContactUsView : UIView!
    
    @IBOutlet weak var vContactUsViewDetail : UIView!
    @IBOutlet weak var btnContactUsIcon : UIButton!
    @IBOutlet weak var btnContactUsText : UIButton!
    
    @IBOutlet weak var btnPhoneView : UIButton!
    @IBOutlet weak var vPhoneView : UIView!
    
    @IBOutlet weak var vPhoneViewDetail : UIView!
    @IBOutlet weak var btnPhoneIcon : UIButton!
    @IBOutlet weak var btnPhoneText : UIButton!
    
    
    var finEduPageViewController: FinEduPageViewController? {
        didSet {
            finEduPageViewController?.finEduDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        didHomeActive()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let finEduPageViewController = segue.destination as? FinEduPageViewController {
            self.finEduPageViewController = finEduPageViewController
        }
    }

   
   
    func didHomeActive() {
        vIndicatorHome.isHidden = false
        vIndicatorVideos.isHidden = true
        vIndicatorAboutUs.isHidden = true
        
        hidePhoneDetail()
        hideFacebookDetail()
        hideContactUsDetail()
    }
    
    func didVideosActive(){
        vIndicatorHome.isHidden = true
        vIndicatorVideos.isHidden = false
        vIndicatorAboutUs.isHidden = true
        
        hideFacebook()
        hideContact()
        hidePhone()

    }
    
    func didAboutUsActive(){
        vIndicatorHome.isHidden = true
        vIndicatorVideos.isHidden = true
        vIndicatorAboutUs.isHidden = false

        hidePhoneDetail()
        hideFacebookDetail()
        hideContactUsDetail()

    }
}

extension FinEduViewController{
    @IBAction func didTapHome(_ sender: UIButton) {
        finEduPageViewController?.scrollToViewController(index: 0)
        didHomeActive()
    }
    
    @IBAction func didTapVideos(_ sender: UIView){
        finEduPageViewController?.scrollToViewController(index: 1)
        didVideosActive()
    }
    
    @IBAction func didTapAboutUs(_ sender: UIView){
        finEduPageViewController?.scrollToViewController(index: 2)
        didAboutUsActive()
    }
    
    @IBAction func didFbShowViewDetailTap(_ sender: UIView){
        showFacebookDetail()
    }
    
    @IBAction func didFbHideViewDetailTap(_ sender : UIView){
        hideFacebookDetail()
    }
    
    @IBAction func didFbTextViewDetailTap(_ sender : UIView){
        hideFacebookDetail()
        openFacebookUrl()
    }
    
    @IBAction func didCuShowViewDetailTap(_ sender: UIView){
        showContactUsDetail()
    }
    
    @IBAction func didCuHideViewDetailTap(_ sender : UIView){
        hideContactUsDetail()
    }
    
    @IBAction func didCuTextViewDetailTap(_ sender : UIView){
        hideContactUsDetail()
        openContactUsUrl()
    }
    
    @IBAction func didPhoneShowViewDetailTap(_ sender: UIView){
        showPhoneDetail()
    }
    
    @IBAction func didPhoneHideViewDetailTap(_ sender : UIView){
        hidePhoneDetail()
    }
    
    @IBAction func didPhoneTextViewDetailTap(_ sender : UIView){
        hidePhoneDetail()
        openPhoneCall()
    }
}

extension FinEduViewController{
    func showFacebookDetail(){
        vFacebookViewDetail.isHidden = false
        vFacebookView.isHidden = true
        var fbFrame = vFacebookViewDetail.frame;
        let screenSize: CGRect = UIScreen.main.bounds
        fbFrame.origin.x = screenSize.width - fbFrame.width;
        UIView.animate(withDuration: 1.2, delay:0.0, options:.curveEaseOut, animations: { self.vFacebookViewDetail.frame = fbFrame; },  completion: { finished in
            
        });
    }
    
    func hideFacebookDetail(){
        vFacebookViewDetail.isHidden = false
        vFacebookView.isHidden = true
        var fbFrame = vFacebookViewDetail.frame;
        fbFrame.origin.x = vFacebookView.frame.origin.x;
        UIView.animate(withDuration: 1.2, delay:0.0, options:.curveEaseOut, animations: { self.vFacebookViewDetail.frame = fbFrame; },  completion: { finished in
            self.vFacebookView.isHidden = false
            self.vFacebookViewDetail.isHidden = true
        });

    }
    
    func openFacebookUrl() {
        let url = NSURL(string: "https://www.facebook.com/WMIsg/photos/a.567627296644102.1073741825.142122185861284/1406339156106241/?type=3&theater")!
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    func hideContact() {
        vContactUsView.isHidden = true
        vContactUsViewDetail.isHidden = true
        var cuFrame = vContactUsViewDetail.frame;
        cuFrame.origin.x = vContactUsView.frame.origin.x;
        self.vContactUsViewDetail.frame = cuFrame
    }
    
    func hideFacebook(){
        vFacebookViewDetail.isHidden = true
        vFacebookView.isHidden = true
        var fbFrame = vFacebookViewDetail.frame;
        fbFrame.origin.x = vFacebookView.frame.origin.x;
        self.vFacebookViewDetail.frame = fbFrame;
    }
    
    func hidePhone(){
        vPhoneViewDetail.isHidden = true
        vPhoneView.isHidden = true
        var phoneFrame = vPhoneViewDetail.frame;
        phoneFrame.origin.x = vContactUsView.frame.origin.x;
        self.vPhoneViewDetail.frame = phoneFrame;
    }
    
    func showContactUsDetail(){
        vContactUsViewDetail.isHidden = false
        vContactUsView.isHidden = true
        var cuFrame = vContactUsViewDetail.frame;
        let screenSize: CGRect = UIScreen.main.bounds
        cuFrame.origin.x = screenSize.width - cuFrame.width;
        UIView.animate(withDuration: 1.2, delay:0.0, options:.curveEaseOut, animations: { self.vContactUsViewDetail.frame = cuFrame; },  completion: { finished in
            
        });
    }
    
    func hideContactUsDetail(){
        vContactUsViewDetail.isHidden = false
        vContactUsView.isHidden = true
        var cuFrame = vContactUsViewDetail.frame;
        cuFrame.origin.x = vContactUsView.frame.origin.x;
        UIView.animate(withDuration: 1.2, delay:0.0, options:.curveEaseOut, animations: { self.vContactUsViewDetail.frame = cuFrame; },  completion: { finished in
            self.vContactUsView.isHidden = false
            self.vContactUsViewDetail.isHidden = true
        });
        
    }
    
    func showPhoneDetail(){
        vPhoneViewDetail.isHidden = false
        vPhoneView.isHidden = true
        var phoneFrame = vPhoneViewDetail.frame;
        let screenSize: CGRect = UIScreen.main.bounds
        phoneFrame.origin.x = screenSize.width - phoneFrame.width;
        UIView.animate(withDuration: 1.2, delay:0.0, options:.curveEaseOut, animations: { self.vPhoneViewDetail.frame = phoneFrame; },  completion: { finished in
            
        });
    }
    
    func hidePhoneDetail(){
        vPhoneViewDetail.isHidden = false
        vPhoneView.isHidden = true
        var phoneFrame = vPhoneViewDetail.frame;
        phoneFrame.origin.x = vContactUsView.frame.origin.x;
        UIView.animate(withDuration: 1.2, delay:0.0, options:.curveEaseOut, animations: { self.vPhoneViewDetail.frame = phoneFrame; },  completion: { finished in
            self.vPhoneView.isHidden = false
            self.vPhoneViewDetail.isHidden = true
        });
        
    }
    
    
    func openContactUsUrl() {
//        let url = NSURL(string: "http://www.wmi.com.sg/contact-us.html")!
//        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func openPhoneCall(){
        let url = NSURL(string: "telprompt://+6568286988")!
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }

}

extension FinEduViewController: FinEduPageViewControllerDelegate {
    
    func finEduPageViewController(_ finEduPageViewController: FinEduPageViewController,
        didUpdatePageCount count: Int) {
        //pageControl.numberOfPages = count
    }
    
    func finEduPageViewController(_ finEduPageViewController: FinEduPageViewController,
        didUpdatePageIndex index: Int) {
        //pageControl.currentPage = index
        switch(index)
        {
        case 0:
            didHomeActive()
            break
        case 1:
            didVideosActive()
            break
        case 2:
            didAboutUsActive()
            break
        default:
            didHomeActive()
        }
    }
    
}

extension FinEduViewController : MFMailComposeViewControllerDelegate {
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["contact@wmi.com.sg"])
        mailComposerVC.setSubject("")
        mailComposerVC.setMessageBody("", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        
        sendMailErrorAlert.addAction(cancelAction)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
