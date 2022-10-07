//
//  UIView+Youtube.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/09/28.
//

import UIKit

extension UIView {
    static let BORDER_TAG = 6521467
    
    @IBInspectable public var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            layer.borderColor = color.cgColor
        }
    }
    
    /// : Border width of view; also inspectable from Storyboard.
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    /// Corner radius of view; also inspectable from Storyboard.
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    /// : Shadow color of view; also inspectable from Storyboard.
    @IBInspectable public var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    /// : Shadow offset of view; also inspectable from Storyboard.
    @IBInspectable public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    /// : Shadow opacity of view; also inspectable from Storyboard.
    @IBInspectable public var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    /// : Shadow radius of view; also inspectable from Storyboard.
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    func addBorder(_ arr_edge: [UIRectEdge] = [.top, .bottom, .left, .right], color: UIColor = UIColor(cgColor: #colorLiteral(red: 0.9257614213, green: 0.9257614213, blue: 0.9257614213, alpha: 1)), thickness: CGFloat = 1) {
        for subview in self.subviews {
            if subview.tag == UIView.BORDER_TAG {
                subview.removeFromSuperview()
            }
        }
        for edge in arr_edge {
            let subview = UIView()
            subview.backgroundColor = color
            subview.tag = UIView.BORDER_TAG
            self.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
            switch edge {
            case .top, .bottom:
                subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
                subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
                subview.heightAnchor.constraint(equalToConstant: thickness).isActive = true
                if edge == .top {
                    subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
                } else {
                    subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
                }
            case .left, .right:
                subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
                subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
                subview.widthAnchor.constraint(equalToConstant: thickness).isActive = true
                if edge == .left {
                    subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
                } else {
                    subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
                }
            default:
                break
            }
        }
    }
}
