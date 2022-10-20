//
//  ProductDetailViewModel.swift
//  ProductListRepo
//
//  Created by Mahmoud Farag on 10/20/22.
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay

class ProductDetailViewModel: BaseViewModel{
    
    var productSub = PublishSubject<ProductListResponseModel>()
    private var product:ProductListResponseModel?
    init (model: ProductListResponseModel){
        super.init()
        self.product = model
    }
    
    func getData(){
        if let model = product{
            self.productSub.onNext(model)
        }
    }
}
