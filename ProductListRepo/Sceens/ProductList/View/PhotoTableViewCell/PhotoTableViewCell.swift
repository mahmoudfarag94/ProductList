//
//  PhotoTableViewCell.swift
//  PhotosRepo
//
//  Created by Mahmoud Farag on 10/20/22.
//  Copyright © 2022 Mahmoud Farag. All rights reserved.
//


import UIKit
import Kingfisher

class PhotoTableViewCell: UITableViewCell {

    static let identifire = "PhotoTableViewCell"
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellData(model: ProductListResponseModel){
        photoImageView.kf.indicatorType = .activity
        guard let url = URL(string: model.image ?? "")else{return}
        photoImageView.kf.setImage(with: url)
        captionLbl.text = model.title ?? ""
        priceLbl.text = "\( model.price ?? 0.0) EGP"
    }
    
}
