//
//  CommonUtils.swift
//  finedu
//
//  Created by Huy Le on 4/15/17.
//  Copyright © 2017 WMI. All rights reserved.
//

import Foundation
import UIKit

class CommonUtils {
    
    static let sharedInstance: CommonUtils = CommonUtils()
    
    func updateTextFont(textView : UITextView, fontMinSize : CGFloat) -> UIFont {
        var fontSize = textView.font?.pointSize;
        let minSize : CGFloat = fontMinSize;
        var size : CGSize = textView.sizeThatFits(CGSize(width: textView.frame.width, height: 10000));
        while (fontSize! > minSize &&  size.height >= textView.frame.size.height ) {
            fontSize = fontSize! - 1.0;
            textView.font = UIFont(name: (textView.font?.fontName)!, size: fontSize!)
            size = textView.sizeThatFits(CGSize(width: textView.frame.width, height: 10000));
        }
        return textView.font!;
    }
    
    private init() {}
    
}
