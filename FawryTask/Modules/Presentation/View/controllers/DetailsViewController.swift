//
//  DetailsViewController.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 05/12/2021.
//

import Foundation
import UIKit

class DetailsViewController: BaseViewController {
    
    var newsModel: NewsModel!
    
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!

    init(newsModel: NewsModel) {
        self.newsModel = newsModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData(newsModel)
    }
    
    func displayData (_ model: NewsModel) {
        guard let imageURL = URL(string: model.downloadURL) else {
            return
        }
        
        authorImage.kf.setImage(
            with: imageURL,
            placeholder: UIImage(named: "placeholder_large"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        
        authorLabel.text = model.author
    }
    
    // MARK: - Actions
    @IBAction func didPressCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
