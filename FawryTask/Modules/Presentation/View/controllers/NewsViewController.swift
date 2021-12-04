//
//  NewsViewController.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import UIKit

class NewsViewController: BaseViewController {
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    var viewModel: NewsViewModel!
    
    override func viewDidLoad() {
        viewModel = NewsViewModel(repoistory: NewsRepoisotry())
        super.viewDidLoad()
        viewModel.getNews()
    }
    
}
