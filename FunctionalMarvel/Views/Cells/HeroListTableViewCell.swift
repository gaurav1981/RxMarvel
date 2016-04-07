//
//  HeroListTableViewCell.swift
//  FunctionalMarvel
//
//  Created by Segii Shulga on 11/20/15.
//  Copyright © 2015 Sergey Shulga. All rights reserved.
//

import UIKit.UITableViewCell
import RxSwift

class HeroListTableViewCell: RxTableViewCell, ReusableView, NibProvidable {
   @IBOutlet weak var cellImageView: UIImageView!
   @IBOutlet weak var label: UILabel!
}


extension HeroListTableViewCell: BindableView {
   typealias V = HeroListViewModel
   
   func bindViewModel(viewModel: V) {
      _ = viewModel.title.asObservable()
         .takeUntil(onPrepareForReuse)
         .bindTo(label.rx_text)
      _ = viewModel.thumbnailURL
         .asObservable()
         .takeUntil(onPrepareForReuse)
         .bindTo(cellImageView.rxex_imageURL)
   }
}
