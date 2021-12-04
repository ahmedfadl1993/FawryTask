//
//  NewsRepoisotryProtocol.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

protocol NewsRepoisotryProtocol {
    func getNews(page: Int, size: Int, completion: @escaping NewsCompletion, failure: @escaping Failure)
}


