//
//  PhotoListViewController.swift
//  PhotosRepo
//
//  Created by Mahmoud Farag on 10/20/22.
//  Copyright © 2022 Mahmoud Farag. All rights reserved.
//


import UIKit
import RxCocoa
import RxSwift
import ImageSlideshow
import Kingfisher

class PhotoListViewController: BaseViewController<PhotoListViewModel> {

    @IBOutlet weak var photoListTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupTableView()
        bindViewModel()
        bintToTableView()
    }
    
    func setupTableView(){
        photoListTblView.estimatedRowHeight = 152
        photoListTblView.rowHeight = UITableView.automaticDimension
        photoListTblView.delegate = nil
        photoListTblView.dataSource = nil
        photoListTblView.registerCell(type: PhotoTableViewCell.self)
    }
    
    override func bindViewModel(){
        viewModel = PhotoListViewModel(useCase: PhotoListUseCase())
        guard let viewModel = viewModel else {return}
        viewModel.photos
            .bind(to: photoListTblView.rx.items(cellIdentifier: PhotoTableViewCell.identifire, cellType: PhotoTableViewCell.self)) { (row, photo, cell) in
                cell.setCellData(model: photo)
        }.disposed(by: disposeBag)
    }
    
    func bintToTableView(){
        
        photoListTblView.rx.modelSelected(ProductListResponseModel.self).subscribe(onNext: {(model) in
            let detailvc  = ProductDetailsViewController.getDetailInstance(item: model)
            self.navigationController?.pushViewController(detailvc, animated: true)
        }).disposed(by: disposeBag)
    }
}
