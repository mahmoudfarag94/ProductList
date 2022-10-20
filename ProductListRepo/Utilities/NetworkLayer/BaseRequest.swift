//
//  BaseRequest.swift
//  PhotosRepo
//
//  Created by Mahmoud Farag on 10/20/22.
//  Copyright © 2022 Mahmoud Farag. All rights reserved.
//

import Foundation
import Alamofire

class BaseRequest{
   
    var path:String
    var method:HTTPMethod = .get
    var paramters:[String:Any]? = nil
    var header:HTTPHeaders? = nil
    var encoding:ParameterEncoding
    
    internal init(path: String, method: HTTPMethod = .get, paramters: [String : Any]? = nil, header: [String : String]? = nil) {
        self.path = path
        self.method = method
        self.paramters = paramters
        self.header = HTTPHeaders(header ?? [:])
        switch method {
        case .get:
            encoding = URLEncoding.default
        case.post:
            encoding = JSONEncoding.default
        default:
            encoding = JSONEncoding.default
        }
    }
}
