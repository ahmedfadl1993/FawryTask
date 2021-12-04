//
//  NewsViewModel.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

class NewsViewModel {
    
    private(set) var totalNewsCount = Bindable<Int>(0)
    private(set) var newsData = Bindable<[NewsModel]>([])

    private var repoistory: NewsRepoisotryProtocol!
    
    init (repoistory: NewsRepoisotryProtocol) {
        self.repoistory = repoistory
    }
    
    func getNews() {
        repoistory.getNews(page: 1, size: 10) { [weak self] result in
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
}
