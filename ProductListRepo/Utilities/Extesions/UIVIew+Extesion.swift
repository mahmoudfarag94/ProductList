//
//  View+Extension.swift
//  PhotosRepo
//
//  Created by Mahmoud Farag on 10/20/22.
//  Copyright © 2022 Mahmoud Farag. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
    func registerCell<T: UITableViewCell>(type: T.Type, bundle: Bundle? = nil){
        let className = String(describing: type.self)
        let nib = UINib(nibName: className, bundle: nil)
        self.register(nib, forCellReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with cellType: T.Type ,for indexPath: IndexPath)-> UITableViewCell{
        let className = String(describing: cellType.self)
        return self.dequeueReusableCell(withIdentifier: className, for: indexPath) as! T
    }
}



extension UIView{
    @IBInspectable
    var circulate: Bool{
        set{
            self.layer.cornerRadius = self.frame.height/2
        }
        get{
            return self.circulate
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    @IBInspectable
    var minTopMaxBottomRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMaxYCorner]
        }
    }
    
    @IBInspectable
    var maxTopMinBottomRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.maskedCorners = [.layerMaxXMinYCorner , .layerMinXMaxYCorner]
        }
    }
    
    @IBInspectable
    var topCorner :CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
        }
    }
    
    @IBInspectable
    var leftCorner :CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.maskedCorners = [.layerMinXMinYCorner , .layerMinXMaxYCorner]
        }
    }
    
    @IBInspectable
    var rightCorner :CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.maskedCorners = [.layerMaxXMinYCorner , .layerMaxXMaxYCorner]
        }
    }
}
//MARK: - UIImageView.
extension UIImageView{
    
    func setImage(urlString: String , holder: UIImage? = nil){
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: urlString), placeholder: holder ?? UIImage(named: ""))
    }
}
