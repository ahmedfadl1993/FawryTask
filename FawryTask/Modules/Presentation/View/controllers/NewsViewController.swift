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
        registerCollectioView()
        viewModel.getNews()
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
    }
    
    func registerCollectioView () {
        newsCollectionView.register(
            UINib(nibName: NewsCollectionViewCell.identifier(),
                  bundle: nil),
            forCellWithReuseIdentifier: NewsCollectionViewCell.identifier())
    }
    
    override func observeBindables() {
        disposeBag.add(viewModel.newsData.bind({ [weak self] newsData in
            guard let self = self else {
                return
            }
            self.newsCollectionView.reloadData()
        }))
    }
    
}


extension NewsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.totalNewsCount.value
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let newsCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NewsCollectionViewCell.identifier(),
                for: indexPath) as? NewsCollectionViewCell else {
            fatalError("DequeueReusableCell failed")
        }
        newsCell.config(model: self.viewModel.newsData.value[indexPath.row])
        return newsCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - 10) / 2 , height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerView", for: indexPath)
        
        let activityView = UIActivityIndicatorView(style: .large)
            activityView.center = CGPoint(x: footerView.frame.width / 2, y: footerView.frame.height / 2)
            activityView.startAnimating()
            footerView.addSubview(activityView)
        
        return footerView
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.nextPage()
    }
}
