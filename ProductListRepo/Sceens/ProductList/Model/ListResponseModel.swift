//
//  PhotoListResponseModel.swift
//  PhotosRepo
//
//  Created by Mahmoud Farag on 10/20/22.
//  Copyright © 2022 Mahmoud Farag. All rights reserved.
//


import Foundation
struct ProductListResponseModel: Codable{
   var id: Int?
   var title: String?
   var price: Double?
   var description, category: String?
   var image: String?
   var rating: Rating?

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case description
        case category, image, rating
    }
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double?
    let count: Int?
}




