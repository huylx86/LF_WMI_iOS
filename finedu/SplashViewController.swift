//
//  SplashViewController.swift
//  finedu
//
//  Created by Huy LX on 3/14/17.
//  Copyright © 2017 WMI. All rights reserved.
//

import UIKit
import QuartzCore

class SplashViewController: UIViewController{
    
    @IBOutlet weak var viewText : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewText.layer.cornerRadius = 5;
        viewText.layer.masksToBounds = true;
        viewText.backgroundColor = UIColor.gray;
        
    }
}
