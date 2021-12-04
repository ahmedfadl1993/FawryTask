//
//  APIs.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

class APIs {
    //MARK:- APIs Class
    fileprivate static let baseUrl = "https://picsum.photos/v2/"

    struct News {
        static func getNews(page: Int, size: Int) -> String {
            return baseUrl + "list?page=\(page)&limit=\(size)"
        }
    }
    
}
