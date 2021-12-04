//
//  NewsModel.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

struct NewsModel: Codable {
    var author: String
    var url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case author, url
        case downloadURL = "download_url"
  
    }
}
