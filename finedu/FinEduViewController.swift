
import UIKit

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
    }
    
    func didVideosActive(){
        vIndicatorHome.isHidden = true
        vIndicatorVideos.isHidden = false
        vIndicatorAboutUs.isHidden = true
    }
    
    func didAboutUsActive(){
        vIndicatorHome.isHidden = true
        vIndicatorVideos.isHidden = true
        vIndicatorAboutUs.isHidden = false
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
}

extension FinEduViewController{
    func showFacebookDetail(){
        vFacebookViewDetail.isHidden = false
        vFacebookView.isHidden = true
        var fbFrame = vFacebookViewDetail.frame;
        let screenSize: CGRect = UIScreen.main.bounds
        fbFrame.origin.x = screenSize.width - fbFrame.width;
        UIView.animate(withDuration: 0.3, delay:0.0, options:.curveEaseOut, animations: { self.vFacebookViewDetail.frame = fbFrame; },  completion: { finished in
            
        });
    }
    
    func hideFacebookDetail(){
        vFacebookViewDetail.isHidden = false
        vFacebookView.isHidden = true
        var fbFrame = vFacebookViewDetail.frame;
        fbFrame.origin.x = vFacebookView.frame.origin.x;
        UIView.animate(withDuration: 0.3, delay:0.0, options:.curveEaseOut, animations: { self.vFacebookViewDetail.frame = fbFrame; },  completion: { finished in
            self.vFacebookView.isHidden = false
            self.vFacebookViewDetail.isHidden = true
        });

    }
    
    func openFacebookUrl() {
        let url = NSURL(string: "https://www.facebook.com/WMIsg/photos/a.567627296644102.1073741825.142122185861284/1406339156106241/?type=3&theater")!
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    func showContactUsDetail(){
        vContactUsViewDetail.isHidden = false
        vContactUsView.isHidden = true
        var cuFrame = vContactUsViewDetail.frame;
        let screenSize: CGRect = UIScreen.main.bounds
        cuFrame.origin.x = screenSize.width - cuFrame.width;
        UIView.animate(withDuration: 0.3, delay:0.0, options:.curveEaseOut, animations: { self.vContactUsViewDetail.frame = cuFrame; },  completion: { finished in
            
        });
    }
    
    func hideContactUsDetail(){
        vContactUsViewDetail.isHidden = false
        vContactUsView.isHidden = true
        var fbFrame = vContactUsViewDetail.frame;
        fbFrame.origin.x = vContactUsView.frame.origin.x;
        UIView.animate(withDuration: 0.3, delay:0.0, options:.curveEaseOut, animations: { self.vContactUsViewDetail.frame = fbFrame; },  completion: { finished in
            self.vContactUsView.isHidden = false
            self.vContactUsViewDetail.isHidden = true
        });
        
    }
    
    func openContactUsUrl() {
        let url = NSURL(string: "http://www.wmi.com.sg/contact-us.html")!
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
        NSLog("%d", index)
    }
    
}
