//
//  PhotoListViewModel.swift
//  PhotosRepo
//
//  Created by Mahmoud Farag on 10/20/22.
//  Copyright © 2022 Mahmoud Farag. All rights reserved.
//

import RxSwift
import RxCocoa
import RxRelay

class ListViewModel: BaseViewModel{

    var useCase: PhotoAPIType?
    let products = BehaviorRelay<[ProductListResponseModel]>(value: [])
    
    init(useCase: PhotoAPIType) {
        super.init()
        self.useCase = useCase
        getData()
    }
    
    func getData(){
        loadingRelay.accept(true)
        useCase?.getPhotosList(){[weak self] (model, error)  in
            if error != nil {
                print(error?.localizedDescription ?? "")
            }else{
                self?.products.accept(model ?? [])
            }
            self?.loadingRelay.accept(false)
        }
    }
}
