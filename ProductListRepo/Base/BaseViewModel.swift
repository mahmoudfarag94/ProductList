//
//  BaseViewModel.swift
//  PhotosRepo
//
//  Created by Mahmoud Farag on 10/20/22.
//  Copyright © 2022 Mahmoud Farag. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RxRelay

class BaseViewModel{
    
    var bag = DisposeBag()
    var errorRelay = PublishRelay<BaseError>()
    var loadingRelay = PublishRelay<Bool>()
    
}

enum BaseError: Error{
    
    case noInternet(String)
    case validation(String)
    case custom(Error)
    case statusCode(String)
    
    func getErrorType()->String{
        switch self{
        case.custom(let erorr):
            return erorr.localizedDescription
        case .noInternet(let internetError):
            return internetError
        case .validation(let validationError):
            return validationError
        case .statusCode(let statusCodeError):
            return statusCodeError
        }
    }
}

