//
//  BaseViewController.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    var disposeBag = DisposableBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        observeBindables()
    }

    func observeBindables() {}
    
}
