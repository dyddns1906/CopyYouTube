//
//  UIViewController+YouTube.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/09/27.
//

import UIKit

extension UIView {
    public func loadViewFromNib(nib: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nib, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
