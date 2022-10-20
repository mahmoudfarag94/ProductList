//
//  ProductListUseCase.swift
//  PhotosRepo
//
//  Created by Mahmoud Farag on 10/20/22.
//  Copyright © 2022 Mahmoud Farag. All rights reserved.
//

import Foundation

protocol PhotoAPIType {
    func getPhotosList(completion: @escaping (_ list: [ProductListResponseModel]? , _ error: Error?)->Void)
}

class PhotoListUseCase: PhotoAPIType{
    func getPhotosList(completion: @escaping ([ProductListResponseModel]? , Error?) -> Void) {
        let req = BaseRequest(path: WebServices.products.getEndPoint())
        GenaricService.shared.genariceAPI(request: req) {(model: [ProductListResponseModel]! , error, code) in
            if error !=  nil {
                completion(nil, error)
            }else{
                completion(model , nil)
            }
        }
    }
}
