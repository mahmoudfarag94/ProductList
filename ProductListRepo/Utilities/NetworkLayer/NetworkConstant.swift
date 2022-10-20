//
//  NetworkConstant.swift
//  PhotosRepo
//
//  Created by Mahmoud Farag on 10/20/22.
//  Copyright © 2022 Mahmoud Farag. All rights reserved.
//

import Foundation

enum EnviromentType{
    
    case production
    case debuging
    
    func getEnviroment()->String{
        switch self {
        case .production:
            return "https://fakestoreapi.com/"
        case .debuging:
            return "https://fakestoreapi.com/"
        }
    }
}

enum WebServices: String{
    
    case products = "products"
    
    func getEndPoint()->String{
        let base = EnviromentType.production.getEnviroment()
        print("base url - ---- \(base)")
        switch self {
        case .products :
            return "\(String(describing: base))\(rawValue)"
        }
    }
}


