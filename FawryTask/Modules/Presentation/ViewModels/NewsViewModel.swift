//
//  NewsViewModel.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

class NewsViewModel: PaginationViewModel {
    
    var pageIndex: Int = 1
    var pageSize = 10
    var shouldPaginate: Bool = false
    
    private(set) var totalNewsCount = Bindable<Int>(0)
    private(set) var newsData = Bindable<[NewsModel]>([])

    private var repoistory: NewsRepoisotryProtocol!
    
    init (repoistory: NewsRepoisotryProtocol) {
        self.repoistory = repoistory
    }
    
    func getNews(atPage: PageIndex = .first) {
        
        if atPage == .first {
            pageIndex = 1
        }else {
            pageIndex += 1
        }
        repoistory.getNews(page: pageIndex, size: pageSize) { [weak self] result in
            guard let self = self else {
                return
            }
            let newItems = result.adding(NewsModel(author: "", url: "", downloadURL: ""), afterEvery: 5)
            self.newsData.value.append(contentsOf: newItems)
            self.totalNewsCount.value = self.newsData.value.count

        } failure: { errorMessage in
            print("error message ")
        }
    }

    func nextPage(index: Int) {
        if index == self.totalNewsCount.value - 1 {
            getNews(atPage: .next)
        }
    }
    
}
