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

class BaseViewController<T: BaseViewModel>: UIViewController{
    
    let disposeBag = DisposeBag()
    var viewModel:T?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel(){
        guard let viewModel = viewModel else {return}
        viewModel.loadingRelay.subscribe{(isloading) in
            //show or hide loader.
        }.disposed(by: disposeBag)
    }
}
