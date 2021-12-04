//
//  NewsViewModel.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

class NewsViewModel {
    private var repoistory: NewsRepoisotryProtocol!
    
    init (repoistory: NewsRepoisotryProtocol) {
        self.repoistory = repoistory
    }
    
    func getNews() {
        repoistory.getNews(page: 1, size: 10) { news in
            print("newssssss ")
            print("---------------")
            
            print(news)
        } failure: { errorMessage in
            print("error message ")
        }

    }
}
