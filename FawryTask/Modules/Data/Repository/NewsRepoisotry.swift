//
//  NewsRepoisotry.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

class NewsRepoisotry: NewsRepoisotryProtocol{
    
    func getNews(page: Int, size: Int, completion: @escaping NewsCompletion, failure: @escaping Failure) {

        let request: BaseRequestProtocol = PicsRequest(page: page, pageSize: size)
        
        APIFetcher.instance.request(request: request) { result in
            guard let reponseData = result else {
                failure("something went wrong")
                return
            }
            do {
                let decoder  = JSONDecoder()
                let result = try decoder.decode([NewsModel].self, from: reponseData)
                completion(result)
            }catch let error {
                failure(error.localizedDescription)
            }
        } onFailure: { error in
            failure(error?.message ?? "")
        }
    }
}
