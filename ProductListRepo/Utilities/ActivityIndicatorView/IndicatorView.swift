//
//  IndicatorView.swift
//  StarWarsOpediaRepo
//
//  Created by Smart Zone on 5/25/22.
//

import UIKit
import NVActivityIndicatorView


class IndicatorView: UIView {

    static let id  = "IndicatorView"
    @IBOutlet weak var loaderView: NVActivityIndicatorView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLoaderView()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoaderView()
    }
    
    
    func setupLoaderView(){
        loaderView.type = .ballSpinFadeLoader
        loaderView.color = .darkGray
    }
    
    func loadNibFile()->UIView{
        let nib = UINib(nibName: IndicatorView.id, bundle: nil)
        let view = nib.instantiate(withOwner: self).first as! IndicatorView
        return view
    }
}
