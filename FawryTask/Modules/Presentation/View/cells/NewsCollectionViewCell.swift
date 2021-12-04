//
//  NewsCollectionViewCell.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import UIKit
import Kingfisher

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(model: NewsModel) {
        
        authorImage.kf.indicatorType = .activity
        author.text = model.author
        guard let imageURL = URL(string: model.downloadURL) else {
            authorImage.image = UIImage(named: "placeholder_large")
            return
        }
        let processor = DownsamplingImageProcessor(size: authorImage.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        authorImage.kf.setImage(
            with: imageURL,
            placeholder: UIImage(named: "placeholder_large"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheMemoryOnly
            ])

    }
    
}
