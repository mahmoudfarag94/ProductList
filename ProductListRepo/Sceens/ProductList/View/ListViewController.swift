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

class ListViewController: BaseViewController<ListViewModel> {

    @IBOutlet weak var ListTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupTableView()
        bindViewModel()
        bintToTableView()
    }
    
    func setupTableView(){
        ListTblView.estimatedRowHeight = 152
        ListTblView.rowHeight = UITableView.automaticDimension
        ListTblView.delegate = nil
        ListTblView.dataSource = nil
        ListTblView.registerCell(type: PhotoTableViewCell.self)
    }
    
    override func bindViewModel(){
        viewModel = ListViewModel(useCase: PhotoListUseCase())
        guard let viewModel = viewModel else {return}
        viewModel.products
            .bind(to: ListTblView.rx.items(cellIdentifier: PhotoTableViewCell.identifire, cellType: PhotoTableViewCell.self)) { (row, photo, cell) in
                cell.setCellData(model: photo)
        }.disposed(by: disposeBag)
    }
    
    func bintToTableView(){
        
        ListTblView.rx.modelSelected(ProductListResponseModel.self).subscribe(onNext: {(model) in
            let detailvc  = ProductDetailsViewController.getDetailInstance(item: model)
            self.navigationController?.pushViewController(detailvc, animated: true)
        }).disposed(by: disposeBag)
    }
}
