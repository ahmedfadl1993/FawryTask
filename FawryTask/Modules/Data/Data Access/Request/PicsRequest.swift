//
//  PicsRequest.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

class PicsRequest: BaseRequestProtocol {
    
    private var page: Int = 0
    private var pageSize: Int = 0
    
    init (page: Int, pageSize: Int) {
        
        self.page = page
        self.pageSize = pageSize
    }
    
    var url: String {
        return APIs.News.getNews(page: self.page, size: pageSize)
    }
}
