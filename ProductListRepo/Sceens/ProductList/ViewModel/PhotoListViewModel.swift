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

class PhotoListViewModel: BaseViewModel{

    var useCase: PhotoAPIType?
    let photos = BehaviorRelay<[ProductListResponseModel]>(value: [])
    var loadMoreRelay = BehaviorRelay<Bool>(value: false)
    
    private var arr = [ProductListResponseModel](){
        didSet{
            photos.accept(arr)
        }
    }
    
    init(useCase: PhotoAPIType) {
        super.init()
        self.useCase = useCase
        getData()
    }
    
    func getData(){
        self.loadMoreRelay.accept(true)
        useCase?.getPhotosList(){[weak self] (model, error)  in
            if error != nil {
                print(error?.localizedDescription ?? "")
            }else{
                self?.arr.append(contentsOf: model ?? [])
                self?.loadMoreRelay.accept(false)
            }
        }
    }
}
