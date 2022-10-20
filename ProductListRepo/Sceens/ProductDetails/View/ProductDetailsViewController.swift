//
//  ProductDetailsViewController.swift
//  ProductListRepo
//
//  Created by Mahmoud Farag on 10/20/22.
//

import UIKit
import RxCocoa
import RxSwift
import Cosmos
import Kingfisher

class ProductDetailsViewController: BaseViewController<ProductDetailViewModel> {
    
    @IBOutlet weak var productNameLbl:UILabel!
    @IBOutlet weak var productFullImg:UIImageView!
    @IBOutlet weak var productPriceLbl:UILabel!
    @IBOutlet weak var productDescriptionLbl:UILabel!
    @IBOutlet weak var rate: CosmosView!
    
    private var img = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        bindViewModel()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        let sub = viewModel?.productSub.asDriver(onErrorJustReturn: ProductListResponseModel())
        sub?.map{"\($0.image ?? "")"}.drive(onNext: { [weak self] str in
            self?.productFullImg.setImage(urlString: str ?? "")
        }).disposed(by: viewModel!.bag)
        sub?.map{"\($0.price ?? 0.0)"}.drive(productPriceLbl.rx.text).disposed(by: viewModel!.bag)
        sub?.map{$0.title ?? ""}.drive(productNameLbl.rx.text).disposed(by: viewModel!.bag)
        sub?.map{$0.description ?? ""}.drive(productDescriptionLbl.rx.text).disposed(by: viewModel!.bag)
        sub?.map{$0.rating.map{$0.rate ?? 0.0} ?? 0.0}.drive(rate.rx.rating).disposed(by: viewModel!.bag)
        sub?.map{$0.rating.map{"\($0.count ?? 0) reviews"}}.drive(rate.rx.text).disposed(by: viewModel!.bag)
        viewModel?.getData()
    }
    
    static func getDetailInstance(item: ProductListResponseModel) -> UIViewController{
        let detailVC = ProductDetailsViewController.instantiate(fromAppStoryboard: .Main)
        let viewModel = ProductDetailViewModel(model: item)
        detailVC.viewModel = viewModel
        return detailVC
    }
}
