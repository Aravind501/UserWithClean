//
//  SafeAreaView.swift
//  
//
//  Created by trioangle on 18/02/22.
//

import Foundation
import UIKit

class SafeAreaView: UIView {

    @IBOutlet var topSafeAreaView: UIView!
    @IBOutlet var bottomSafeAreaView: UIView!
    @IBOutlet var mainAreaView: UIView!
    
    override func awakeFromNib() {
       
    }
    
    func setFrameForTopSafeAreaView(_ parentFrame: CGRect) -> CGRect{
        topSafeAreaView.frame = parentFrame
        return topSafeAreaView.frame
    }
    
    func setFrameForBottomSafeAreaView(_ parentFrame: CGRect) -> CGRect{
        bottomSafeAreaView.frame = parentFrame
        return bottomSafeAreaView.frame
    }
    
    class func initViewFromXib()-> SafeAreaView{
        let nib = UINib(nibName: "SafeAreaView", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil)[0] as! SafeAreaView
        return view
    }

}
