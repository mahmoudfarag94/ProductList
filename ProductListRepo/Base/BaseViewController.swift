//
//  BaseViewController.swift
//  PhotosRepo
//
//  Created by Mahmoud Farag on 10/20/22.
//  Copyright © 2022 Mahmoud Farag. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RxRelay
import NVActivityIndicatorView

class BaseViewController<T: BaseViewModel>: UIViewController{
    
    let disposeBag = DisposeBag()
    var viewModel:T?
    
    lazy var loaderView: IndicatorView = {
        let nib = UINib(nibName: IndicatorView.id, bundle: nil)
        let loader = nib.instantiate(withOwner: self, options: nil).first as! IndicatorView
        loader.loaderView.type = .lineScale
        return loader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel(){
        guard let viewModel = viewModel else {return}
        viewModel.loadingRelay.subscribe(onNext: { [weak self] (isloading) in
            guard let self = self else {return}
            isloading == true ? self.startLoader() : self.stopLoader()
        }).disposed(by: disposeBag)
    }
    
    func startLoader(){
        loaderView.loaderView.startAnimating()
    }
    
    func stopLoader(){
        loaderView.loaderView.stopAnimating()
    }
  
}
