//
//  RxTableViewCell.swift
//  FunctionalMarvel
//
//  Created by Segii Shulga on 10/8/15.
//  Copyright © 2015 Sergey Shulga. All rights reserved.
//

import UIKit
import RxSwift

class RxTableViewCell: UITableViewCell {
   let onPrepareForReuse: Observable<Void> = PublishSubject()
   
   override func prepareForReuse() {
      super.prepareForReuse()
      (self.onPrepareForReuse as? PublishSubject<Void>)?.on(.Next())
   }
}
